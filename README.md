# Moodle Assignment Scripts
A collection of scripts for use with the Moodle "Assignment" activity.

Currently, two batch (pure cmd) scripts are provided, tested in Windows 10.

1. GenerateFolderStructure.bat , which generates the folder structure required by the Moodle Assignment activity to upload "feedback files" individually for each student. The name and ID information comes from the offline grading csv, which can be downloaded as described [here](https://docs.moodle.org/38/en/Using_Assignment#Download_the_Grading_Worksheet_to_record_grades).

2. FillFoldersFromPool.bat , which fills each folder found within the "Students" folder choosing a file at random from those in the "Pool" folder. The use case is if we have a set of instructions from which we want to give each student one at random.

## Usage Instructions: Folder Structure Generation

1. Create a folder in your system where the process will take place.

2. Copy the script GenerateFolderStructure.bat to this folder.

3. This folder must have a subfolder name "Students".

4. Run GenerateFolderStructure.bat .

5. Inside the "Students" sub-folder, you should find the generated folder structure. Once you are done filling them with your files as you please, add these folders to a zip file and use the corresponding option in Moodle Assignment to upload it.

6. A csv output file is created with each run named folder_structure.log

## Usage Instructions: Fill Folders From Pool

1. Generate the folder structure as described before. Copy FillFoldersFromPool.bat to the base, original folder you created in step 1 of the Folder Structure Generation.

2. Create a "Pool" sub-folder, copy all the files that you want to be an option for every student.

3. Run FillFoldersFromPool.bat . 

4. In every one of the folders that this script finds inside the "Students" sub-folder, a file will be copied from the "Pool" sub-folder, chosen at random.

5. A csv output file is created with each run named file_assignment.log

### Suggestions, comments, issues, etc, are welcome
