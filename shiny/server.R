#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tm)
library(ANLP)
library(RWeka)


shinyServer(function(input,output) {
  #unigram.df = readRDS("~/unigram.RDS")
  #bigram.df = readRDS("~/bigram.RDS")
  #trigram.df = readRDS("~/trigram.RDS")
  #quadgram.df = readRDS("~/quadgram.RDS")
  source("tokenloading.R")
  
  modelsList <- list(quadgram.df,trigram.df,bigram.df,unigram.df)
  
 # outputText <- NULL
  outputText <- reactive({
    
    inputText <- input$box1
    if (inputText!= "") { 
   
    predict_Backoff(inputText,modelsList) }
  }) 

 output$out1 <- outputText 

})
