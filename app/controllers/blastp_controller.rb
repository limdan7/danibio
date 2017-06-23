class BlastpController < ApplicationController
    include  BlastpHelper
    
    def compare
        
    end
    
    def result
        seq = params[:sequence]
        @answer = sequencing(seq).html_safe
    end
       
end
