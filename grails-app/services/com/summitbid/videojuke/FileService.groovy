package com.summitbid.videojuke



/**
 *  Encapsulatest the file upload and parsing
 */
class FileService {
    boolean transactional = true
    /*
     * Filesystem path where reports are stored
     */
    String defaultDataPath
    /*
     * Uploaded file
     */
    File file
    /*
     * storeage file path + filename
     */
    String  filePath
    /*
     * Filename only
     */
    String  fileName
    /*
     * filename plus date
     */
    String  storeageFileName
    /*
     * date the file was uploaded
     */
    Date    uploadDate

    /**
     * Check whether the current file is already in the repository.
     * NOTE: This will never return a duplicate since all files are
     * now appended with a timestamp
     */
    def verifyNoFileNameDups = { path, fileName ->
        log.debug("path: ${path}")
        new File( path ).eachFile{file ->
            println file
            if (it == fileName)
            {
                println("**DUPLICATE found!!! Renaming with timestamp**")
            }
        }
    }

    /**
    *  Reads in the file, stores iton the filesystem, returns the path to it
    *  @org.springframework.web.multipart.MultipartFile multiPartFile for upload over the web.
    *  @String storeageFilePath file system path to store the file
    */
    def readFile(org.springframework.web.multipart.MultipartFile multiPartFile, String storageFilePath) {
        log.debug("readFile: enter")
        uploadDate = new Date()
        def        dateString = uploadDate.toString()
        dateString = dateString.replace(' ','-')
        dateString = dateString.replace(':','_')
        storageFilePath = storageFilePath + "." + dateString
//        storageFilePath = storageFilePath + "." + "someText"
        println(storageFilePath)
        file = new File(storageFilePath )
        filePath = storageFilePath

//        verifyNoFileNameDups(default_data_path, filePath)
        //file.mkdirs()
        multiPartFile.transferTo(file);
        int idx = 0;
        //file.eachLine { println("got a line: " + idx++) };

        // do something with the file
        if (file)
        {
            log.debug("file uploaded!!")
            log.debug("file     : " + multiPartFile.toString())
            log.debug("file size: " + multiPartFile.getSize())
            log.debug("file type: " + multiPartFile.getContentType())
            fileName = multiPartFile.getOriginalFilename()
            storeageFileName = fileName + "." + dateString
            log.debug("file name       : " + fileName)
            log.debug("unique file name: " + storeageFileName)
        }

        storeTables();
        return storageFilePath
        log.trace("Exiting readFile")
    }

     /**
     * check for errors  and try to save, or print errors.
     * @param sectionList list of current section's elements.
     */
    def validateStore = { sectionList ->
          def idx = 0
          sectionList.each {
              idx++
            if (!it?.hasErrors() && it?.save())
            {
            }
            else
            {
                println("ERROR did not save: ${it} at index ${idx}.")
                println("errors: ${it?.errors}")
                return false
            }
        }
    }

     /**
     * Store cluster, slicegroup, slice, pipe, nodegroup, dnp tables to db.
     */
    def storeTables()
    {
        log.trace("storeTables enter")

        log.trace("storeTables exit")
    }

   /**
    * parse the specified section in the file using the supplied sectionClosure handler
    * @File file to parse
    * @String section the inifile section to parse (ie "cluster", "pipe", etc)
    * @Return the object list
    */
    static def parseSection(File file, String section, Closure sectionClosure)
    {
        println("parseSection: enter")
        def isSection
        def sectionMap = [:]
        int idx = 0
        def newList;

        file.eachLine{
            println(it)
        }
        println("parseSection: exit")
        return newList
    }

    String toString()
    {
        return "FileService: ${fileName}, ${filePath}"
    }


}

