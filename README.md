# Dropbox + Docker POC
Downloads an arbitrary folder from your Dropbox account via Docker.

## Setup
### Setting up Docker
Visit https://docs.docker.com/get-started/ and follow the instructions to set up Docker on your machine.

### Setting up Dropbox

1. Visit https://www.dropbox.com/developers and click "Create apps"
2. Make the following selections:
   1. For "Choose an API", select the first choice, "Dropbox API"
   2. For "Choose the type of access you need", select "Full Dropbox"
   3. Enter a name. Must be globally unique on Dropbox.
   ![](https://i.imgur.com/rKqJPL4.png)
3. Click "Create app"
4. You'll be taken to the App Console for your new app. Under the "OAuth 2" section, under
   "Generated access token", click, "Generate"
    ![](https://i.imgur.com/x21vpLD.png)
5. Copy the token. **WARNING: Anyone with this token has access to your full Dropbox account.
   Keep it secure.**

## Running the Image
Our image will download the specified folder to a file called "download.zip" in your current working directory. To run the image, use the `docker run` command, passing in the following:
- Your token.
- A path to the folder, starting from the root ("/"). Omit the first slash, e.g., if my target
  Dropbox folder is at /foo/bar, enter "foo/bar" as the path.

Here's the script:

On Windows, run the following commands in Powershell:
```powershell
$DBX_TOKEN=<your token>
$DBX_PATH=<your path>
docker run -it -e DBX_TOKEN=$DBX_TOKEN -e DBX_PATH=$DBOX_PATH -v ${PWD}:/data d4hines/dropbox-poc
```
On *nix environments, run the following commands in your shell:
(Due to some bugs with WSL and Docker, I haven't tested this, so the syntax might be off, but
it should be close)
```bash
DBX_TOKEN=<your token>
DBX_PATH=<your path>
docker run -it -e DBX_TOKEN=$DBX_TOKEN -e DBX_PATH=$DBOX_PATH -v ${pwd}:/data d4hines/dropbox-poc
```
