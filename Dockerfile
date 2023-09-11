FROM linuxserver/code-server:4.16.1

# Install packages
RUN apt update && apt install -y build-essential vim zsh python3 python3-pip python3.10-venv unzip
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install

# Install brew 
RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Run these commands to activate brew:
#    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /config/.zprofile
#    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# Install brew packages
RUN /home/linuxbrew/.linuxbrew/bin/brew install gcc ruby brew-gem
# TODO Fix cfn-nag install
#RUN /home/linuxbrew/.linuxbrew/bin/brew gem install cfn-nag

# Install python modules
RUN pip3 install cfn-lint virtualenv

# Install pulumi
RUN curl -fsSL https://get.pulumi.com | sh

