<?php

require_once 'vendor/autoload.php';

use PhpOffice\PhpWord\TemplateProcessor;

$templateProcessor = new TemplateProcessor('Prueba.docx');

$nombre = 'Arthour';
$apellido = 'Vásquez';

$templateProcessor->setValue('nombre', $nombre);
$templateProcessor->setValue('apellido', $apellido);

$templateProcessor->saveAs('Realizado.docx');

$nombreDoc = "Realizado.docx";
header("Content-Description: File Transfer");
header('Content-Disposition: attachment; filename="' . $nombreDoc . '"');
header('Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document');
header('Content-Transfer-Encoding: binary');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Expires: 0');
$objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($documento, "Word2019");
$objWriter->save("php://output");
?>