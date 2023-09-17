// Using the existing Jenkins Global Library
@Library('CommonLib@master') _


// Defining the main build pipeline
def common = new com.lib.JenkinsCommonDockerBuildPipeline()


// Calling the function within the main pipeline
common.runPipeline()
