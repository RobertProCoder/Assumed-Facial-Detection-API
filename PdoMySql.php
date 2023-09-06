<?php
class PdoMySql 
{
    private static function OpenDatabase($DBase)
    {
        $Options = [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
        PDO::ATTR_EMULATE_PREPARES => false];
        $Connection = new PDO("mysql:host=".$DBase['Host'].";port=".$DBase['Port'].";dbname=".$DBase['DBName'].";charset=utf8mb4;",$DBase["Username"],$DBase["Password"],$Options);

        return $Connection;

        
    }
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    public static function ExecuteDML_Query($DBase,$Query,$Parameter=null)
    {
        $Result ="";
        set_error_handler(function($errno,$errstr,$errfile,$errline){
        throw new ErrorException($errstr,$errno,0,$errfile,$errline);
        });

        try
        {
            $Connection = Self::OpenDatabase($DBase);
            $Statement = $Connection->prepare($Query);
                if($Parameter == null)
                {
                    $Statement->execute();
                }else{$Statement->execute($Parameter);}

                $Result = json_encode($Statement->fetchAll(PDO::FETCH_ASSOC),JSON_UNESCAPED_UNICODE);
        }catch(PDOException $e){return json_encode(Array("Status" => "Error:".$e->getMessage()),JSON_UNESCAPED_UNICODE);}
    
    $Result=str_replace("\\","",$Result);
    $Result=str_replace("\"{","{",$Result);
    $Result=str_replace("}\"","}",$Result);
    
    return $Result;
    }
//-----------------------------------------------------------------------------------------------------------------------------------------
}
?>