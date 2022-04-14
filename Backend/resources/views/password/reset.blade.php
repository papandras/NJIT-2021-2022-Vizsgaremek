<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Elfelejtett jelszó visszaszerzése</title>
    <style>
        body {
            background-color: #E9D8A6;
            user-select: none;
        }

        #whitediv {
            width: 400px;
            height: fit-content;
            background-color: white;
            border-radius: 5px;
            vertical-align: center;
            text-align: center;
            margin: auto;
            margin-top: 50px;
            padding-top: 0px;
            padding-bottom: 50px;
            border: none;
        }

        #logo {
            width: 400px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            margin-bottom: 20px
        }

        input[type=password],
        input[type=email] {
            background-color: #c4c4c4;
            opacity: 80%;
            border-radius: 5px;
            border-color: none;
            width: 60%;
            height: 30px;
            text-align: center;
            border: none;
            margin-top: 10px;
            margin-bottom: 10px;
            outline: none;
        }

        input[type=password]:focus,
        input[type=email]:focus {
            border: 2px solid #009688;
        }

        input[type=submit] {
            background-color: #009688;
            color: white;
            width: 140px;
            height: 50px;
            border-radius: 5px;
            box-shadow: none;
            margin: auto;
            border: none;
            margin-top: 20px;
            display: block;
        }

        input[type=submin]:active {
            border: 2px solid #c4c4c4;
        }

        label {
            display: block
        }

        .invalid {
            color: red;
            display: block;
            margin-bottom: 20px;
        }

    </style>
</head>

<body>
    <div id="whitediv">
        <img src="https://i.kek.sh/xvXX90wsl5C.png" alt="Logo" id="logo" />
        <form action="{{ route('password.update') }}" method="post">
            @csrf
            @error('password')
                <span class="invalid">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror
            @error('email')
            <span class="invalid">
                <strong>{{ $message }}</strong>
            </span>
        @enderror
            <label for="email">Email cím</label>
            <input type="email" name="email" id="email">
            <label for="password">Új jelszó</label>
            <input type="password" name="password" id="password">
            <label for="password_confirmation">Új jelszó megerősítése</label>
            <input type="password" name="password_confirmation" id="password_confirmation">
            <input type="submit" value="Küldés">
        </form>
    </div>
</body>

</html>
