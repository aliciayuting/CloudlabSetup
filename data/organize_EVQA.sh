

cd /mydata/
#sudo mkdir EVQA
cd EVQA


#sudo unzip EVQA_data.zip
#sudo rm -rf EVQA_data.zip
#sudo unzip EVQA_passages.zip
#sudo rm -rf EVQA_passages.zip

echo "Finished EVQA data setup"

#sudo wget https://huggingface.co/datasets/BByrneLab/M2KR_Images/resolve/main/EVQA/google-landmark.tar
#sudo wget https://huggingface.co/datasets/BByrneLab/M2KR_Images/resolve/main/EVQA/inat.zip


sudo mkdir google-landmark 
sudo tar -xvf google-landmark.tar -C google-landmark
sudo mkdir inat 

#sudo unzip inat.zip -d inat/
sudo rm -rf google-landmark.tar
#sudo rm -rf inat.zip
echo "Finished image data installation"


sudo mkdir index
sudo tar -xvzf EVQA_test_split.tar.gz -C index/
sudo tar -xvzf EVQA_train_split.tar.gz -C index/
sudo rm EVQA_test_split.tar.gz EVQA_train_split.tar.gz
echo "Finished index installation"


#sudo mv ~/models_pipeline1.zip ./
#sudo unzip -j models_pipeline1.zip -d models
#sudo rm models_pipeline1.zip 
echo "Finished model ckpts"

sudo rm -rf __MACOSX
