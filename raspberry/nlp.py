import speech_recognition as sr
import pyttsx3
import requests
import json

# Initialize Text-to-Speech engine
engine = pyttsx3.init()

# Initialize Speech Recognition
recognizer = sr.Recognizer()

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
        print("Sorry, I couldn't understand what you said.")
        return ""
    except sr.RequestError as e:
        print("Request to Google Speech Recognition service failed; {0}".format(e))
        return ""

# Function to query Gemini API
def get_gemini_data(query):
    api_key = "AIzaSyCevIBWjGD3ByxwMfItNL3vmWhKFw-J0u8"
    url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key={api_key}"
    headers = {"Content-Type": "application/json"}
    data = {
        "input": {
            "textInput": query
        }
        # "outputConfig": {
        #     "gated": False
        # }
    }
    #data_json = json.dumps(data)
    response = requests.post(url, headers=headers, json=data)
    response_data = response.json()
    return response_data

    

# # Example usage
query = "What is fever."
result = get_gemini_data(query)
print(result)


# Main function
def main():
    speak("Welcome to SHPA, Say help for assistant")
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
                 response_text = "Here is what you should do now: {}".format(gemini_data)
                 speak(response_text)
    
   

if __name__ == "__main__":
    main()
