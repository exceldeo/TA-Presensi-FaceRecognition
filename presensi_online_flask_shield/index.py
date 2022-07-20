import pickle,sys
import cv2
import time
import operator
import warnings
import keras
from PIL import Image
import numpy as np
from tensorflow.keras.models import load_model
from keras.applications.mobilenet import MobileNet
from keras.models import Model
from tensorflow.keras.backend import clear_session
warnings.filterwarnings("ignore")
from flask import Flask

app = Flask(__name__)

def loadModel(nmModel):
    f = open(nmModel, 'rb')
    model = pickle.load(f)
    return model

MODEL_PATH = 'C:\\xampp\\htdocs\\TA-Presensi-FaceRecognition\\presensi_online_flask_shield\\model.h5'
model = load_model(MODEL_PATH,compile=False)

@app.route('/predict_shield')
def index_shield():
    file = 'Foto/shield62.jpeg'

    # Parameters
    input_size = (150,150)

    #define input shape
    channel = (3,)
    input_shape = input_size + channel

    #define labels
    labels = ['noshield', 'shield']

    # read image
    im = Image.open(file)
    X = preprocess(im,input_size)
    X = reshape([X])
    y = model.predict(X)

    # print( labels[np.argmax(y)], np.max(y) )
    return labels[np.argmax(y)]

def preprocess(img,input_size):
    nimg = img.convert('RGB').resize(input_size, resample= 0)
    img_arr = (np.array(nimg))/255
    return img_arr

def reshape(imgs_arr):
    return np.stack(imgs_arr, axis=0)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

if __name__ == '__main__':
    app.run(debug=True, threaded=True)