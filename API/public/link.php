<?php

$targetFolder = $_SERVER['DOCUMENT_ROOT'].'/API/storage/app/public';
$linkFolder = $_SERVER['DOCUMENT_ROOT'].'/API/public/storage';
symlink($targetFolder,$linkFolder);
echo 'Symlink completed';
// echo $_SERVER['DOCUMENT_ROOT'];