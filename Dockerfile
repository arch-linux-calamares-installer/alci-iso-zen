FROM archlinux:latest

# Set environment variables
ENV OUTPUT_DIR=/output

# Install archiso tool
RUN pacman -Sy --noconfirm archiso sudo

# Copy directories
COPY archiso /archiso

# Copy installation script
COPY installation-scripts/ /installation-scripts/
RUN chmod +x /installation-scripts/30-build-the-iso-the-first-time.sh

# Run the installation script
CMD ["/installation-scripts/30-build-the-iso-the-first-time.sh"]