#!/usr/bin/env python
# coding: utf-8

# In[3]:


# 실시간
import transcribe_streaming_mic
import speech_recognition as sr
import pyttsx3

r = sr.Recognizer()

# 음성 인식
def STT():
    with sr.Microphone() as source:
        r.adjust_for_ambient_noise(source,duration=0.2)
        audio = r.listen(source)

        myText = r.recognize_google(audio,language='ko-KR')
        myText = myText.lower()

        print(myText)

