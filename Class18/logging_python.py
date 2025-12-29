import logging # importing this to create a log file
import os # importing this to create a folder 

# create a logger string

logging_str = "[%(asctime)s: %(levelname)s: %(module)s: %(message)s]" # the pattern or the format of the message will be shown in the log file
log_folder = "logs" # the name of the folder it is making
log_file = "logs/running_log.log" # name of the log file it is creating in log folder 
os.makedirs(log_folder, exist_ok=True) # here this code is making the log folder

logging.basicConfig(   # in this we are defing the file how the message are going to be stored 
    level = logging.INFO, # this is info level log (it is used to log the information)
    format = logging_str,

    handlers= [
        logging.FileHandler(log_file) # this here is creating the log file inside the folder
    ]
)

logger = logging.getLogger("mylog")




def add_number(a,b):
    out = a+b
    logger.info("Sucessfully executed")

    return out


num = add_number(3,4)
print(num)
logger.info("Code has been executed")