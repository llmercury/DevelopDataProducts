childHeight <- function(sex, mh, fh) {
    (mh + fh + as.numeric(sex) * 5)/2
}

heightRange90 <- function(sex, mh, fh) {
    if (sex == "1") {
        lhr <- childHeight(sex, mh, fh) - 2.1
        hhr <- childHeight(sex, mh, fh) + 2.1        
    }
    else {
        lhr <- childHeight(sex, mh, fh) - 1.7
        hhr <- childHeight(sex, mh, fh) + 1.7
    }
    paste(lhr, "to", hhr)
}

shinyServer(
    function(input, output) {
        output$height <- renderPrint({
            input$goButton
            isolate(childHeight(input$sex, input$mh, input$fh))})
        output$heightRange <- renderPrint({
            input$goButton
            isolate(heightRange90(input$sex, input$mh, input$fh))})
        output$learnMore <- renderText({if (input$sex == 1) "Young men often continue to grow a little past 18 until they reach 21, but their height at age 18 is very close to their final adult height. This prediction is a best guess. Based on the formula we used there is a 50 percent chance that your boy's full-grown height will be within 0.8 inches (above or below) of this prediction, and a 90 percent chance that it will be within 2.1 inches."
                                        else "This prediction is a best guess. Based on the formula we used there is a 50 percent chance that your girl's full-grown height will be within 0.7 inches (above or below) of this prediction, and a 90 percent chance that it will be within 1.7 inches."})
    }
)