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
            height: 450px;
            background-color: white;
            border-radius: 5px;
            vertical-align: center;
            text-align: center;
            margin: auto;
            margin-top: 50px;
            padding-top: 0px;
            border: none;
        }

        #logo {
            width: 400px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        a {
            text-decoration: none;
            color: #009688;
            letter-spacing: 1px
        }

        footer {
            text-align: center;
            margin-top: 50px;
        }

    </style>
</head>

<body>
    <div id="whitediv">
        <img src="https://i.kek.sh/xvXX90wsl5C.png" alt="Logo" id="logo" />
        <p>Kedves {{ $user['name'] }}!</p>
        <p>Ezt az emailt azért kapod mert a közelmúltban jelszó emlékeztetőt kértél a <a href="#">FiveFile</a>
            oldalon!</p>
        <p>Jelszavadat <strong><a href="{{route('password.reset', [$token])}}" target="_blank">IDE</a></strong> kattintva tudod megváltoztatni.</p>
        <footer>
            Üdvözlettel: A FiveFile csapata
        </footer>
    </div>
</body>

</html>
