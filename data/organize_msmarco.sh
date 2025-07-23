cd /mydata/
sudo mkdir msmarco
cd msmarco
sudo mv ~/msmarco_3_clusters.tar.gz ./
sudo mv ~/msmarco_pq.index ./
sudo mv ~/queries_audio5000.pkl ./
#sudo wget https://vortexstorage7348269.blob.core.windows.net/msmarco/msmarco_3_clusters.tar.gz
#sudo wget https://vortexstorage7348269.blob.core.windows.net/msmarco/passages_embeddings_baai1.5small.tsv
#sudo wget https://vortexstorage7348269.blob.core.windows.net/msmarco/queries_eval_embeddings_baai1.5small.tsv
#sudo wget https://vortexstorage7348269.blob.core.windows.net/msmarco/msmarco_pq.index
#sudo wget https://vortexstorage7348269.blob.core.windows.net/1mmsmarco/queries_audio5000.pkl
#sudo wget https://vortexstorage7348269.blob.core.windows.net/1mmsmarco/ms_macro_1m_queries_embeds.npy

echo "Finished wget"
sudo tar -xvzf msmarco_3_clusters.tar.gz
sudo rm msmarco_3_clusters.tar.gz

echo "extracted msmarco_3_clusters"

