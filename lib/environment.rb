root_path = File.join(File.dirname(__FILE__), "..")
lib_path = File.join(root_path,"lib")
app_name =  "log_parser"

$LOAD_PATH << root_path
$LOAD_PATH << lib_path
$LOAD_PATH << File.join(lib_path, app_name)

require app_name
