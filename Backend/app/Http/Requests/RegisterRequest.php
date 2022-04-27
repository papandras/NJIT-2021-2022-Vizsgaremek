<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|unique:users,name|min:3|max:20',
            'email' => 'required|unique:users,email|min:10|max:50',
            'password' => 'required|min:8|max:20',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'A felhasználónév megadása kötelező!',
            'name.unique' => 'Ezzel a felhasználónévvel már regisztráltak!',
            'name.min' => 'A felhasználónév minimum 3 karakter hosszú!',
            'name.max' => 'A felhasználónév maximum 20 karakter hosszú!',
            'email.required' => 'Az email megadása kötelező!',
            'email.unique' => 'Ezzel az email címmel már regisztráltak!',
            'email.min' => 'Az email minimum 3 karakter hosszú!',
            'email.max' => 'Az email maximum 20 karakter hosszú!',
            'password.required' => 'A jelszó megadása kötelező!',
            'password.min' => 'A jelszó minimum 8 karakter hosszú!',
            'password.max' => 'A jelszó maximum 20 karakter hosszú!',
        ];
    }
}
