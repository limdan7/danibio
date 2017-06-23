class AnalysisController < ApplicationController
    
    include  BlastpHelper
    def new
        @Anaylsis = Analysis.new
    end
    
    def create
        
        input_dna = params[:input_dna]
        @Analysis = Analysis.new
        @Analysis.input_dna = input_dna
        seq = input_dna
        @Analysis.translation_from_dna = sequencing(seq).html_safe
        @Analysis.save
        redirect_to '/analysis/open_reading_frame/?a_id='+@Analysis.id.to_s
    end
    
    def open_reading_frame
        a_id = params[:a_id]
        
    end
end
