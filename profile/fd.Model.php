<?php
require_once("../Application.Config.php");
require_once("../PdoMySql.php");


class FD{
    static function UpdateRecord($Record)
    {
        set_error_handler(function($errno,$errstr,$errfile,$errline){
            throw new ErrorException($errstr,$errno,0,$errfile,$errline);
        });

        try
        {
            $MyRecord = Array($Record->ID,$Record->Image_Id,$Record->Name,$Record->Age,$Record->Course,$Record->Year_Level,$Record->Block,$Record->Email_Address);

            $Result = PdoMySQL::ExecuteDML_Query(Application::$DBase,"call Profile_Update(?,?,?,?,?,?,?,?)",$MyRecord);
            if(trim($Result) != ""){
                $Result = json_decode($Result);
                $Result = $Result[0]->Record_Status;
                echo json_encode(Array("Status: " =>$Result),JSON_UNESCAPED_UNICODE);
            }else{echo json_encode(Array("Status: " => "Error: Request has failed. The server has encountered an error."),JSON_UNESCAPED_UNICODE);}
        }catch(ErrorException $e)
        {   
            echo json_encode(Array("Status"=>"Error: Request has failed. The server cannot interpret the requested service."),
            JSON_UNESCAPED_UNICODE);
        }
    }
//----------------------------------------------------------------------------------------------------------------------------------------------------

    static function SearchRecord($Image_Id){
        set_error_handler(function($errno,$errstr,$errfile,$errline){
            throw new ErrorException($errstr,$errno,0,$errfile,$errline);
        });

        try{
            $Result = PdoMySql::ExecuteDML_Query(Application::$DBase,"call Search_Profile(?)",[$Image_Id]);
            if(Trim($Result)!=""){
                    $Result = json_decode($Result);
                    echo json_encode(Array("Status"=>$Result),JSON_UNESCAPED_UNICODE);
            }else{
                echo json_encode(Array("Status"=>"Error: Request has failed. The server has encountered an error."),JSON_UNESCAPED_UNICODE);
            }
        }catch(ErrorException $e){
            echo json_encode(Array("Status"=>"Error: Request has failed. The server cannot interpret the request service."),JSON_UNESCAPED_UNICODE);
        }
    }

    static function ViewImage($Image_Id){

        try{
            $Result = PdoMySql::ExecuteDML_Query(Application::$DBase,"call View_Image(?)",[$Image_Id]);

            if(trim($Result) != ""){
                $Result = json_decode($Result);
                echo json_encode(Array("Status" => $Result),JSON_UNESCAPED_UNICODE);
            }else{
                echo json_encode(Array("Status" => "Service encountered an error"));
            }

        }catch(ErrorException $e){
                echo json_encode(Array("Status" => "Error: Request has Failed"));
        }
    }
//------------------------------------------------------------------------------------------------------------------------------------------------------------
    static function Authenticate($method,$images){
        
        try{
            $userImages = Array($images->image1,$images->image2,$images->image3);
            $Result = PdoMySql::ExecuteDML_Query(Application::$DBase,"call ".$method."_Method(?,?,?)",$userImages);

            if(trim($Result) != ""){
                $Result = json_decode($Result);
                $Result = $Result[0]->Result;
                echo json_encode(Array("Status" => $Result),JSON_UNESCAPED_UNICODE);
            }
        }catch(ErrorException $e){
            echo json_encode(Array("Status"=>"Error: Request has failed. The server cannot interpret the request service."),JSON_UNESCAPED_UNICODE);
        }
    }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    static function Attendance($Record)
    {
        try{
            $Array_Record = Array($Record->Image,$Record->Name,$Record->Course,$Record->Year_Level,$Record->Status);
            $Result = PdoMySql::ExecuteDML_Query(Application::$DBase,"call Attendance(?,?,?,?,?)",$Array_Record);
            if(trim($Result) != ""){
                $Result = json_decode($Result);
                $Result = $Result[0]->Result;
                echo json_encode(Array("Status: " =>$Result),JSON_UNESCAPED_UNICODE);
            }else{echo json_encode(Array("Status: " => "Error: Request has failed. The server has encountered an error."),JSON_UNESCAPED_UNICODE);}
        }catch(ErrorException $e){
            echo json_encode(Array("Status"=>"Error: Request has failed. The server cannot interpret the request service."),JSON_UNESCAPED_UNICODE);
        }
      
    }



}
?>