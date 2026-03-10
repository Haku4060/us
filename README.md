# Purpose
US is a haptic communication app for couples to communicate with the way they want secretly

# Setup
For frontend we use SwiftUI. For backend we use FastAPI.
0. Clone the repository
```
git clone https://github.com/Haku4060/us.git
```
1. Install Requirement
Install uv for package management ([Look for more info](https://docs.astral.sh/uv/guides/install-python/))
```
brew install uv
```
2. Check the version of python
```
uv python list
```
if is not python@3.13
```
uv python install 3.13
```
3. Start the server
```
uv run fastapi dev
```
If there is no issue you should be able to access to http://localhost:8000/

