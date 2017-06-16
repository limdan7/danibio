module BlastpHelper
     def sequencing(seq)
            #  2)A,B인 string 두개로 나누고 각각 번호를 매겨준다. 첫 시작점과 끝 점
            #  3)A,B를 차례대로 0부터 끝까지 가면서 다른 걸 마킹한다. 
            #  4) 그 다른 번호를 출력한다.
            
            #  1)seq 배열을 첫번째 줄, 세번째 줄로 나눈다. 
            i = 1
            query = ""
            subject = ""
            seq.split(/\n/).each do |line|
            	if i%4 == 1
            		query << line
            	elsif i%4 == 3
            		subject << line
            	end
            	i+=1
            end
            # 1) A,B로 나뉜것에서, A는 Query 및 번호 그리고 띄어쓰기 및 엔터 삭제.
            # B의 경우에는 처음 Sbjct 다음의 번호 저장. 그리고 마지막 번호 저장.
            
            query_without_Query = query.gsub('Query','')
            query_without_Space = query_without_Query.tr(' ','')
            query_without_Number = query_without_Space.gsub(/[0-9]/,'')
            
            subject_without_Sbjct = subject.gsub('Sbjct','')
            subject_without_Space = subject_without_Sbjct.tr(' ','')
            subject_without_Number = subject_without_Space.gsub(/[0-9]/,'')
            
            start_index =  subject_without_Sbjct.split(/[A-Z]/)[0].strip.to_i
            
            i = 0
            start = false
            answer_Query_Line = ""
            
            query_without_Number.split("").each do |letter|
                    
                if (letter != subject_without_Number[i]) && !start
            		#만약 카운터가 0이면 (처음 시작이면) 인덱스를 표시한다.
            		index = i+start_index
            		answer_Query_Line << "<strong>" +letter+"</strong>"
            		start = !start #참으로 바뀐다.
            	elsif (letter != subject_without_Number[i]) && start
            		#만약에 계속 진행 중이고 아니면 그냥 더하기.
            		answer_Query_Line << "<strong>"+letter+"</strong>"
            	elsif (letter == subject_without_Number[i]) && start
            		index = i+start_index
            		answer_Query_Line << "<strong>"+letter+"</strong>"
            		start = !start
            	else
            		answer_Query_Line << letter
            	end    
            	i += 1
            end
            
            return answer_Query_Line
        end
end
