# Need to add :latest, otherwise old versions (e.g. of node) are installed
FROM gitpod/workspace-full:latest

# git-lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
RUN sudo apt-get update && sudo apt-get install -y git-lfs
RUN git lfs install

# Doppler
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
RUN echo "deb https://dl.bintray.com/dopplerhq/doppler-deb stable main" | sudo tee /etc/apt/sources.list.d/dopplerhq-doppler.list
RUN sudo apt-get update && sudo apt-get install doppler

# Global Yarn dependencies
RUN echo "\nexport PATH=$(yarn global bin):\$PATH" >> /home/gitpod/.bashrc
RUN yarn global add @babel/core @babel/node

# GraphViz
RUN sudo apt-get install -y graphviz

# Puppeteer dependencies
RUN sudo apt-get update && sudo apt-get install -y libgtk-3-0 libx11-xcb1 libnss3 libxss1 libasound2 libgbm1 libxshmfence1
