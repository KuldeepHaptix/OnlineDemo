using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

/// <summary>
/// Summary description for Common
/// </summary>
public class Common
{
    public Common()
    {
        //
        // TODO: Add constructor logic here
        //
    }
        public string GenerateOTP()
    {
        string otp = string.Empty;

        string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
        string numbers = "1234567890";

        string characters = numbers;

        characters += alphabets + small_alphabets + numbers;

        int length = 6;

        for (int i = 0; i < length; i++)
        {
            string character = string.Empty;
            do
            {
                int index = new Random().Next(0, characters.Length);
                character = characters.ToCharArray()[index].ToString();
            } while (otp.IndexOf(character) != -1);
            otp += character;
        }
        return otp;
    }

    public void sendGUIDByMail(string email, string GUID)
    {
        MailMessage msg = new MailMessage();
        //Add your email address to the recipients
        msg.To.Add(email);
        msg.CC.Add("saleskittestmail@gmail.com");
        //Configure the address we are sending the mail from
        MailAddress address = new MailAddress("info@saleskit.co.in");
        // MailAddress address = new MailAddress("saleskitsoftwaresolution@gmail.com");
        msg.From = address;
        string mailBody = "";
        mailBody += "<p>Saleskit Verification Code</p><br />";
        mailBody += "<p>Hello Sir/Madam,</p><br />";
        mailBody += "<p>Thank you for Signup.</p><br />";
        mailBody += "<p>Please complete the verification process by Click on below Link : <br /><b>";
       
        mailBody += HttpContext.Current.Request.Url.PathAndQuery + @"http://kalpeshsiritcgtest.saleskitsoftwaresolutions.com/Login.aspx?id="+GUID;
      mailBody += "<p>Incase you have exit from email verification screen, Re-login to perform verification.</p>";
        mailBody += "<br /><p>Regards,</p><br />";
        mailBody += "<p>Saleskit Software Solutions</p>";
      
     
        msg.IsBodyHtml = true;
         msg.Subject = "Saleskit Web Verification Code";
        msg.Body = mailBody;

        //Configure an SmtpClient to send the mail.
        SmtpClient client = new SmtpClient();
        client.Host = "smtp.office365.com";
        client.Port = 587;
        client.EnableSsl = true;
        //Setup credentials to login to our sender email address ("UserName", "Password")
        //client.UseDefaultCredentials = false;
        NetworkCredential credentials = new NetworkCredential("info@saleskit.co.in", "Anjohm@1011");
        //NetworkCredential credentials = new NetworkCredential("saleskitsoftwaresolution@gmail.com", "Anjohm@2482");
        client.Credentials = credentials;


        //Send the msg
        client.Send(msg);
    }

    public void sendOtpByMail(string email, string otp)
    {
        MailMessage msg = new MailMessage();
        //Add your email address to the recipients
        msg.To.Add(email);
        msg.CC.Add("saleskittestmail@gmail.com");
        //Configure the address we are sending the mail from
        MailAddress address = new MailAddress("info@saleskit.co.in");
        // MailAddress address = new MailAddress("saleskitsoftwaresolution@gmail.com");
        msg.From = address;
        string mailBody = "";
       // mailBody += "<p>Saleskit Verification Code: "+otp+"</p><br />";
        mailBody += "<p>Hello Sir/Madam,</p><br />";
        mailBody += "<p>Thank you for Signup.</p><br />";
        mailBody += "<p>Please complete the verification process by Entering verification code in next step: <br /><b>";

        mailBody += "<b>" + otp + "</b>";
        mailBody += "<p>Incase you have exit from email verification screen, Re-login to perform verification.</p>";
        mailBody += "<br /><p>Regards,</p><br />";
        mailBody += "<p>Saleskit Software Solutions</p>";


        msg.IsBodyHtml = true;
        msg.Subject = "Saleskit Company Registration Code";
        msg.Body = mailBody;

        //Configure an SmtpClient to send the mail.
        SmtpClient client = new SmtpClient();
        client.Host = "smtp.office365.com";
        client.Port = 587;
        client.EnableSsl = true;
        //Setup credentials to login to our sender email address ("UserName", "Password")
        //client.UseDefaultCredentials = false;
        NetworkCredential credentials = new NetworkCredential("info@saleskit.co.in", "Anjohm@1011");
        //NetworkCredential credentials = new NetworkCredential("saleskitsoftwaresolution@gmail.com", "Anjohm@2482");
        client.Credentials = credentials;


        //Send the msg
        client.Send(msg);
    }
}