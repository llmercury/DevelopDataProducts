childHeight <- function(sex, mh, fh) {
    (mh + fh + as.numeric(sex) * 5)/2
}

shinyServer(
    function(input, output) {
        output$prediction <- renderPrint({
            input$goButton
            isolate(childHeight(input$sex, input$mh, input$fh))})
        output$learnMore <- renderText({"The method used for prediction was developed by Drs. Harry Khamis and Alex Roche published in Pediatrics in 1994. They developed a method that eliminated the need for a bone age x-ray. The Khamis-Roche Method is fairly accurate (within an inch and a half of actual growth) but is only reliable in children who have no other known medical problems.
        "})
    }
)