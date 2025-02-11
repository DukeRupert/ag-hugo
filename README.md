# Aestus Guides

A comprehensive CRPG knowledge base featuring in-depth guides, tactical analysis, and strategic insights. Built with Hugo and the Stack theme.

![Hugo](https://img.shields.io/badge/Hugo-%23FF4088.svg?style=flat&logo=hugo&logoColor=white)
![Hugo Stack Theme](https://user-images.githubusercontent.com/5889006/190859553-5b229b4f-c476-4cbd-928f-890f5265ca4c.png)

## About

Aestus Guides provides deep-dive analysis into classic and modern computer role-playing games, with a particular focus on the Baldur's Gate series and its contemporaries. Our content emphasizes advanced mechanics, system analysis, and tactical decision-making to help players master these complex games.

## Features

- Comprehensive tactical guides
- System mechanics analysis
- Build optimization strategies
- Historical CRPG perspectives
- Regular content updates focusing on both classic and modern CRPGs

## Technical Stack

- **Framework**: Hugo Static Site Generator
- **Theme**: Stack Theme (customized)
- **Deployment**: GitHub Actions
- **Additional Features**:
  - Automatic theme updates via cron job
  - Responsive design
  - Dark/Light mode support
  - Search functionality
  - Category and tag organization

## Local Development

1. Clone the repository:
```bash
git clone https://github.com/yourusername/aestus-guides.git
cd aestus-guides
```

2. Install Hugo (extended version required):
```bash
# Follow Hugo installation instructions for your OS
# https://gohugo.io/installation/
```

3. Start the development server:
```bash
hugo server -D
```

4. View the site at `http://localhost:1313`

## Configuration

The site uses Hugo's configuration system. Key files:

- `config.toml`: Main configuration file
- `content/`: Directory containing all articles and guides
- `assets/`: Custom CSS, JavaScript, and images
- `layouts/`: Custom template overrides

### Important Settings

```toml
baseurl = "https://www.aestusguides.com"
languageCode = "en-us"
title = "Aestus Guides - Memoirs of a CRPG Sage"
```

## Deployment

The site is automatically deployed through GitHub Actions when changes are pushed to the main branch. The workflow:

1. Builds the Hugo site
2. Optimizes assets
3. Deploys to GitHub Pages

## Contributing

If you'd like to contribute content or improvements:

1. Fork the repository
2. Create a feature branch
3. Submit a Pull Request with a clear description of your changes

## License

[Your chosen license]

## Contact

[Your preferred contact method]

---

*"Every roll matters." - Aestus Guides*