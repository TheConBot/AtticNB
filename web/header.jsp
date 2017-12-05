<!DOCTYPE html>
<html lang="en">
    <head>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link rel ="stylesheet" href="style.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <title>Attic</title>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand"href="#"><img src="logo.png"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Properties</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Settings</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Property Settings</a>
                            <a class="dropdown-item" href="#">User Settings</a>
                            <a class="dropdown-item" href="#">Admin Settings</a>                        
                            <a class="dropdown-item" href="#">Log Out</a>
                        </div>
                    </li>
                </ul>
            </div>
            <form class="form-inline input-padding">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">Username</span>
                    <input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </form>
            <form class="form-inline input-padding">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">Password</span>
                    <input type="password" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </form>
             <button type="submit" class="btn btn-default input-padding">Submit</button>
        </nav>
    </body>
