import speech_recognition as sr
import pyttsx3
import requests
import json
import google.generativeai as genai

# Initialize Text-to-Speech engine
engine = pyttsx3.init()

# Initialize Speech Recognition
recognizer = sr.Recognizer()

#congfiguration of gemini api 
gemini_api_key = "AIzaSyCevIBWjGD3ByxwMfItNL3vmWhKFw-J0u8"
genai.configure(api_key=gemini_api_key)
model = genai.GenerativeModel('gemini-pro')

# Function to speak the response
def speak(text):
    engine.say(text)
    engine.runAndWait()

# Function to recognize speech
def listen():
    with sr.Microphone() as source:
        print("Listening...")
        recognizer.adjust_for_ambient_noise(source)
        audio = recognizer.listen(source)

    try:
        query = recognizer.recognize_google(audio).lower()
        print("User Query:", query)
        return query
    except sr.UnknownValueError:
        speak("Sorry, I couldn't understand what you said.")
        listen()
        return ""
    except sr.RequestError as e:
        print("Request to Google Speech Recognition service failed; {0}".format(e))
        return ""



#gemini data function to generate response 
def get_gemini_data(query):
    response = model.generate_content(query + 'in 20 words')
    response_text=response.text
    return response_text
    
    
        

# # # Example usage
# query = "What is fever."
# text = get_gemini_data(query)
# print(text)


# Main function
def main():
    speak("Welcome to SHRA, Say help for assistant or emergency to connect to nurse")
    wakeup = listen()
    if wakeup == "help":
         speak("Hello! How can I assist you today?")
         while True:
             user_query = listen()
             if user_query == "exit":
                 speak("Hope I helped you today take care, get well soon!")
                 break
             elif user_query:
                 gemini_data = get_gemini_data(user_query)
                 response_text = "Here is what you should do now" + gemini_data
                 speak(response_text)
                 speak('If you want to end assistant say exit')
    elif wakeup == "emergency":
        speak("Connecting to nearest available nurse")
    
    else:
        speak("You are doing great, I dont think you need my assistant takecare bye!!")

   

if __name__ == "__main__":
    main()
