# this would contain the code for the nlp mode part


# while true:
#     keep listening for audio

#     if audio doesnt contains "smart assistant":
#         ignore
#     else:
#         get the audio, convert to text
#         pass text query to nlp mode, get response
#         POST request at /nlp
#         return the response to patient as audio 


#testing this is edit mode test to check whether push pull working 
import pyttsx3
import speech_recognition as sr

engine = pyttsx3.init()

recognizer = sr.Recognizer()


engine.setProperty('rate', 150)    
engine.setProperty('volume', 0.9)  

def speak(text):
    
    engine.say(text)
    engine.runAndWait()

def get_medical_info(query):
    #dataset abhi random internet 
    medical_info = {
        'fever': 'Fever is a common symptom of various medical conditions, often caused by infections.',
        'headache': 'A headache can be caused by stress, tension, dehydration, or other medical conditions.',
        'broken bone': 'If you suspect a broken bone, seek medical attention immediately and avoid moving the affected area.',
        'burn': 'For minor burns, run cool water over the affected area and apply aloe vera or an over-the-counter burn cream.',
        'heart attack': 'If you suspect someone is having a heart attack, call emergency services immediately and perform CPR if trained.',
        'Jatin': ' Founder',
        'Akash' : ' Founder'
    }
    
    return medical_info.get(query.lower(), 'Sorry, Nurse is busy.')

def listen_command():
   
    with sr.Microphone() as source:
        print("Speak Up Please...")
        recognizer.adjust_for_ambient_noise(source)
        audio_data = recognizer.listen(source)
        command = ""
        
        try:
            command = recognizer.recognize_google(audio_data)
            print(f"You said: {command}")
        except sr.UnknownValueError:
            print("Sorry, I did not understand that.")
        except sr.RequestError:
            print("Sorry, my speech service is currently unavailable.")
        
        return command.lower()

def main():
    
    speak("Hello! I am your SmartAAI. Are you ok or need help?")
    
    while True:
        speak("Please speak up your concern.")
        
        user_command = listen_command()
        
        if 'exit' in user_command:
            speak("Takecare!")
            break
        
        print(f"SmartAAI: You asked about {user_command}.")
        
        response = get_medical_info(user_command)
        speak(response)

if __name__ == "__main__":
    main()
