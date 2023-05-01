FROM php:8.2-apache

# Install required packages
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libsasl2-dev \
    libzip-dev \
    libgmp-dev \
    zlib1g-dev \
    openssl \
    libpcre3-dev \
    autoconf \
    automake \
    libtool \
    git \
    build-essential \
    python3 \
    python3-pip \
    unzip \
    mlocate \
    ninja-build \
    && rm -rf /var/lib/apt/lists/*

# Install CMake
RUN pip3 install cmake

# Clone and build the ScyllaDB PHP driver
RUN git clone https://github.com/he4rt/scylladb-php-driver.git \
    && cd scylladb-php-driver \
    && cmake --preset Release -DPHP_SCYLLADB_OPTIMISE_FOR_CURRENT_MACHINE=ON \
    && cd out/Release \
    && ninja \
    && ninja install \
    && cd ../.. \
    && rm -rf scylladb-php-driver

# Enable Apache rewrite module
RUN a2enmod rewrite

# Copy configuration files
COPY cassandra.ini /usr/local/etc/php/conf.d/
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Start Apache
CMD ["apache2-foreground"]
