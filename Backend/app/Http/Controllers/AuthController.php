<?php

namespace App\Http\Controllers;

use Mail;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\PasswordResetRequest;
use App\Http\Requests\RegisterRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;

use Illuminate\Support\Str;
use DB;
use Carbon\Carbon;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $data = $request->validated();
        $data["password"] = Hash::make($data["password"]);
        return User::create($data);
    }

    public function login(LoginRequest $request)
    {
        if (!Auth::attempt($request->only('name', 'password'))) {
            return response([
                'message' => 'Hibás adatok!'
            ], Response::HTTP_UNAUTHORIZED);
        }

        $user = Auth::user();

        $token = $user->createToken('token')->plainTextToken;

        $cookie = cookie('jwt', $token, $minutes = 30, $path = null, $domain = null, $secure = false, $httpOnly = false);

        return response([
            'message' => $token
        ])->withCookie($cookie);
    }

    public function forgotpassword(Request $request)
    {
        $request->validate([
            "email" => "required|email:rfc,dns|exists:users,email",
        ]);

        $email = $request->only('email')["email"];

        $user = User::where("email", $email)->first();

        $token = Str::random(64);

        DB::table('password_resets')->insert([
            'email' => $request->email,
            'token' => $token,
            'created_at' => Carbon::now()
        ]);

        Mail::send('emails.reminder', ['user' => $user, 'token' => $token], function ($m) use ($user) {
            $m->from('fivefile@gmail.com', '5File');

            $m->to($user->email, $user->name)->subject('Jelszó emlékeztető!');
        });

        return response([
            'message' => 'Email sikeresen elküldve!'
        ]);
    }

    public function resetpassword($token)
    {
        $updatePassword = DB::table('password_resets')
            ->where([
                'token' => $token
            ])
            ->first();

        if (!$updatePassword) {
            abort(404);
        }
        return view('password.reset', ['token' => $token]);
    }

    public function updatepassword(PasswordResetRequest $request)
    {
        $data = $request->validated();

        User::where('email', $data["email"])
            ->update(['password' => Hash::make($data["password"])]);

        DB::table('password_resets')->where(['email' => $data["email"]])->delete();

        return redirect('http://localhost:3000/');
    }

    public function getNewCookie()
    {

        $user = Auth::user();

        $token = $user->createToken('token')->plainTextToken;

        $cookie = cookie('jwt', $token, $minutes = 30, $path = null, $domain = null, $secure = true, $httpOnly = false);

        return response([
            'message' => $token
        ])->withCookie($cookie);
    }

    public function user()
    {
        return Auth::user();
    }

    public function logout()
    {
        $cookie = Cookie::forget('jwt');

        return response([
            'message' => 'Sikeres kijelentkezés'
        ])->withCookie($cookie);
    }

    public function settings(Request $request)
    {
        $data = $request->validate(
            [
                "email" => "nullable|email:rfc,dns",
                "password" => "nullable|min:8|max:20",
                "profilpic" => "file|image|nullable",
                "confirm" => "required|current_password:sanctum",
                "removepic" => "nullable"
            ],
            [
                "email.email" => "Létező email címet adj meg!",
                "profilpic.file" => "Hibás fájl!",
                "profilpic.image" => "Kizárólag képet tölthetsz fel!",
                'password.min' => "A jelszó minimum 8 karakter hosszú!",
                'password.max' => "A jelszó maximum 20 karakter hosszú!",
                "confirm.required" => "A jelszó megerősítése kötelező!",
                "confirm.current_password" => "Jelszó megerősítés sikertelen!"
            ]
        );

        if (isset($data["profilpic"]) && !is_null($data["profilpic"])) {
            $filename = Auth::user()->name . "-profilpic." . $data['profilpic']->getClientOriginalExtension();
            $request->file("profilpic")->storeAs("profilpic", $filename);
            $data["profilpic"] = $filename;
        }

        if (isset($data["password"]) && !is_null($data["password"])) {
            $data["password"] = Hash::make($data["password"]);
        }

        if(isset($data["removepic"]) && $data["removepic"] == "true"){
            $data["profilpic"] = "base-notfound.svg";
        }

        Auth::user()->update($data);

        return $data;
    }

    public function removeaccount() {
        Auth::user()->delete();

        $cookie = Cookie::forget('jwt');

        return response([
            'message' => 'Sikeres profil törlés'
        ])->withCookie($cookie);
    }
}
