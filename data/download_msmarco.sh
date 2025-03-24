cd /mydata/
sudo mkdir msmarco
cd msmarco
sudo wget https://vortexstorage7348269.blob.core.windows.net/msmarco/msmarco_3_clusters.tar.gz
sudo wget https://vortexstorage7348269.blob.core.windows.net/msmarco/passages_embeddings_baai1.5small.tsv
sudo wget https://vortexstorage7348269.blob.core.windows.net/msmarco/queries_eval_embeddings_baai1.5small.tsv
sudo wget https://vortexstorage7348269.blob.core.windows.net/msmarco/msmarco.index
sudo wget https://vortexstorage7348269.blob.core.windows.net/msmarco/queries_audio1.pkl
wget https://vortexstorage7348269.blob.core.windows.net/msmarco/queries_audio2.pkl

echo "Finished wget"
sudo tar -xvzf msmarco_3_clusters.tar.gz
sudo rm msmarco_3_clusters.tar.gz

echo "extracted msmarco_3_clusters"

