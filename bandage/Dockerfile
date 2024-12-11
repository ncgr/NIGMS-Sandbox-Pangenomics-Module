FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

# update apt and install dependencies
RUN apt update && apt install unzip wget python3-xdg tar -y

# install Bandage
RUN wget https://github.com/asl/BandageNG/releases/download/v2022.09/BandageNG-9eb84c2-x86_64.AppImage
RUN chmod a+x BandageNG-9eb84c2-x86_64.AppImage

# install BLAST+
COPY /install-blast.sh .
RUN ./install-blast.sh
ENV PATH="$PATH:$PWD/ncbi-blast-2.16.0+/bin"

# autoruns Bandage
COPY /root /

# the container becomes unhealthy if Bandage stops running
HEALTHCHECK --retries=1 CMD ps -aux | grep "Bandage" | grep -v "grep" || exit 1

# keep the container running indefinitely
CMD ["sleep", "infinity"]
