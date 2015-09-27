<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <link rel="stylesheet" href="/cart/styles/bootstrap.min.css">
    <link rel="stylesheet" href="/cart/styles/main-styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
    <header id="header">
        <div id="logout">
            <?php if($this->hasLoggedUser()): ?>
                <a href="/cart/account/logout" id="logout-button" class="btn btn-info">Logout</a>
            <?php endif; ?>
        </div>
        <div id="inner-header" class="col-lg-6 col-md-8 col-sm-10 col-xs-12">
            <div id="image">
                <div id="inner-image">
                    <a href="http://localhost/cart/">
                        <img src="/cart/styles/logo.png" />
                    </a>
                </div>
            </div>
            <div id="nav" class="col-xs-12">
                <div id="inner-nav" class="col-xs-12">
                    <?php if($this->hasLoggedUser()): ?>
                        <ul id="menu" class="col-xs-12">
                            <li class="col-xs-6 col-sm-3"><a href="/cart/">Home</a></li>
                            <li class="col-xs-6 col-sm-3"><a href="/cart/categories/index">Categories</a></li>
                            <li class="col-xs-6 col-sm-3"><a href="/cart/products/">Products</a></li>
                            <li class="col-xs-6 col-sm-3"><a href="/cart/users/">Users</a></li>
                        </ul>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </header>
    <?php  include_once(DX_ROOT_DIR . "views\\layouts\\messages.php")?>