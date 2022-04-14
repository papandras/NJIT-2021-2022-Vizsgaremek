<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PasswordResetRequest extends FormRequest
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
            'email' => 'required|email|exists:users,email',
            'password' => 'required|string|min:8|confirmed',
            'confirm' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'password.confirmed' => 'A jelszavak nem egyeznek!',
            'email.exists' => 'Nincs ilyen regisztrált email cím!'
        ];
    }
}
