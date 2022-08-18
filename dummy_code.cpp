#include <iostream>
#include <string>
using namespace std;

inline void send_message_to_ros(string _command, Args ...)
{

  // list of arguements
  va_list args;

  // grab thte number of arguments
  int num_args=0;
  va_start(args,_command);

  cout << "Num args: " << num_args << endl;

  // param sum for checksum calculation
  int param_sum=0;

  // construct message from the arguments
  string message_to_send = _command;
  for (int i=0;i<num_args;i++)
  {
    int argument = va_arg(args,int);
    
    message_to_send+=","+to_string(argument);
    param_sum+=argument;
  }

  // calculate checksum
  int checksum = 1024 - param_sum;

  // append checksum to message to message
  message_to_send +=","+to_string(checksum);

  // send message
  //Serial.println(message_to_send);
  cout << message_to_send << endl;
}

int main()
{

	send_message_to_ros("STS",1,2,3,4);


	return 0;
}