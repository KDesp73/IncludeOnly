#define LOG_LEVEL LOG_LEVEL_ERROR
#define LOGGING_IMPLEMENTATION
#include "logging.h"

int main(){
    INFO("Hello World from logging.h!");
    
    logging_log(LOG_LEVEL_INFO, "This should not print");
    
    return 0;
}

