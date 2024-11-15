FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

# update apt and install dependencies
RUN apt update && apt install unzip wget python3-xdg tar -y

# install Bandage
RUN wget https://github.com/asl/BandageNG/releases/download/v2022.09/BandageNG-9eb84c2-x86_64.AppImage
RUN chmod a+x BandageNG-9eb84c2-x86_64.AppImage

# install BLAST+
RUN ./install-blast.sh
ENV PATH="$PATH:$PWD/ncbi-blast-2.16.0+/bin"

COPY /root /

CMD ["sleep", "infinity"]
