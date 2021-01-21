using System;
using System.Text.Json;
using System.Text.Json.Serialization;
using app.WebMessages;
using WebWindows;

namespace trxy
{
    class Program
    {
        static void Main(string[] args)
        {
            var window = new WebWindow("trxy");

            window.OnWebMessageReceived += (sender, message) =>
            {
                try
                {
                    Console.WriteLine("Message received from web page.");

                    // var request = JsonSerializer.Deserialize<WebMessageRequest>(message);
                    // if (!request.Command.Equals("pickFile", StringComparison.InvariantCultureIgnoreCase))
                    // {
                    //     throw new Exception("Unknown command received");
                    // }

                    var response = new WebMessageResponse
                    {
                        FileName = "test.txt",
                        FileText = "this is some file text"
                    };

                    window.SendMessage(JsonSerializer.Serialize(response));
                }
                catch (Exception exception)
                {
                    var breakme = "here";
                }
            };

            // window.NavigateToLocalFile("wwwroot/index.html");
            window.NavigateToUrl("http://localhost:3000");
            window.WaitForExit();
        }
    }
}
