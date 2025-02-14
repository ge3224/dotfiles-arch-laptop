# ThinkPad T480 Arch Linux Configuration Playbook

This Ansible playbook automates the setup of dual desktop environments (GNOME
and i3) on an Arch Linux system, specifically optimized for ThinkPad T480
hardware.

## Hardware Support

This playbook has been tested and optimized for the following ThinkPad T480 specifications:

- Intel 8th Gen Core processors
- Intel UHD Graphics 620
- Dual battery system
- TrackPoint and touchpad
- Intel Wireless-AC 8265
- HD/FHD display options

## Features

The playbook configures:

### Base System

- Optimized power management with TLP and thermald
- Battery threshold settings for extended battery life
- TrackPoint and touchpad configurations
- Bluetooth and Wi-Fi drivers and firmware
- Fan control and thermal management
- NVME power saving options

### Desktop Environments

#### GNOME

- Full GNOME desktop environment
- GNOME Shell extensions
- GDM display manager configuration
- GNOME-specific power management
- Default application associations

#### i3

- Minimal i3 window manager setup
- Custom status bar configuration
- dmenu/rofi application launcher
- Independent X session configuration
- Minimal resource footprint

### Additional Software

- Development tools and utilities
- Power management tools
- ThinkPad-specific packages
- System monitoring tools
- Backup solutions

## Prerequisites

Before running this playbook, ensure you have:

- A fresh Arch Linux installation
- Ansible 2.9 or newer installed
- sudo privileges
- Network connectivity
- Base development tools (`base-devel`)

## Installation

1. Clone this repository:

```bash
git clone https://github.com/ge3224/dotfiles-arch-laptop
cd dotfiles-arch-laptop
```

2. Run the playbook:

```bash
ansible-playbook main.yml
```


### Environment-Specific Customization

Common issues and solutions:

### Display Issues
- Check xrandr output
- Verify DPI settings in Xresources
- Check display manager logs

### Power Management
- Run `tlp-stat` to verify TLP configuration
- Check battery thresholds with `tlp-stat -b`
- Monitor temperatures with `sensors`

### Session Management
- Check GDM logs for login issues
- Verify Xorg session configurations
- Check environment-specific logs in `~/.local/share/xorg/`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Submit a pull request

## License

MIT License - See LICENSE file for details

## Acknowledgments

- Arch Linux Wiki contributors
- ThinkPad-specific tools maintainers
- GNOME and i3 maintainers
