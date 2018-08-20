"""Predict w/LSTM classifier"""

import pickle
import numpy as np
from keras.preprocessing import sequence
from keras.models import load_model
import tldextract

MODEL_FILE = 'lstm.h5'
VALIDCHAR_FILE = 'valid.pkl'
MAXLEN_FILE = 'maxlen.pkl'

def predict_record(X=[b'www.google.com', b'www.fsgjs717i1ndhahdhd.com']):
    """Predict record X"""

    # Get model
    model = load_model(MODEL_FILE)

    # Get valid chars
    valid_chars = pickle.load(open(VALIDCHAR_FILE, 'rb'))
    maxlen = pickle.load(open(MAXLEN_FILE, 'rb'))

    # Extract domain
    X = [tldextract.extract(x.decode()).domain for x in X]

    # Convert characters to int and pad
    X = [[valid_chars[y] for y in x] for x in X]
    X = sequence.pad_sequences(X, maxlen=maxlen)

    # predict
    t_probs = model.predict_proba(X)
    
    return t_probs

if __name__ == "__main__":
    probs = predict_record()
    print(probs)

