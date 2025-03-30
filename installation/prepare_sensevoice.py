import sys
sys.path.append("./SenseVoice")
import time
from funasr import AutoModel
from funasr.utils.postprocess_utils import rich_transcription_postprocess
from funasr.utils.load_utils import load_audio_text_image_video, extract_fbank
from utils.frontend import WavFrontend, WavFrontendOnline
import librosa
from model import SenseVoiceSmall
import pickle
import torch
import numpy as np


model_dir = "iic/SenseVoiceSmall"
m, kwargs = SenseVoiceSmall.from_pretrained(model=model_dir, device="cuda")
m.eval()
