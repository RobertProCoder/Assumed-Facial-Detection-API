<?php
require_once("fd.Model.php");
$Method = strtoupper($_SERVER["REQUEST_METHOD"]);
$Data = file_get_contents('php://input');
$ObjData = json_decode($Data);

    if(strtoupper($Method)=="POST")
    {
       if(strtoupper($ObjData->Method) == "LAPLACIAN"){FD::Authenticate($ObjData->Method, $ObjData->Images);}
       else if(strtoupper($ObjData->Method) == "FISHER"){FD::Authenticate($ObjData->Method, $ObjData->Images);}
       else if(strtoupper($ObjData->Method) == "EIGEN"){FD::Authenticate($ObjData->Method,$ObjData->Images);}
       else{echo json_encode(Array("Status" => "Unknown Method"));};
    }else{ echo json_encode(Array("Status"=>"Error:POST method is required in the process."),
        JSON_UNESCAPED_UNICODE);}
?>