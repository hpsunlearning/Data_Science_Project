library(data.table)

SB_Word_predict = function(n4,n3,n2,n1,in_put){
    res = data.table(last=rep("",5), frq=rep(0,5))
    while(TRUE){
        l = length(in_put)
        if(l>=3) {
            query = paste(tolower(in_put[(l-2):l]),collapse = "_")
            x = n4[pre==query,]
            if(nrow(x)>0) {
                setorder(x,-n)
                res = rbind(res,x[1:10,c("last","frq")])
                setorder(res,-frq)
                res = res[!is.na(res$frq)]
                res = res[frq>0]
                in_put = in_put[(l-1):l]
                if (nrow(res)>5) {
                    break
                }
            } else {
                in_put = in_put[(l-1):l]
            }
        }else if(l==2) {
            query = paste(tolower(in_put),collapse = "_")
            x = n3[pre==query,]
            x = x[!last %in% res$last]
            if(nrow(x)>0) {
                setorder(x,-n)
                x[,frq:=frq*0.4]
                res = rbind(res,x[1:10,c("last","frq")])
                setorder(res,-frq)
                res = res[!is.na(res$frq)]
                res = res[frq>0]
                in_put = in_put[2]
                if (nrow(res)>5) {
                    break
                }                
            } else {
                in_put = in_put[2]
            }
        }else if(l==1) {
            query = in_put
            x = n2[pre==query,]
            x = x[!last %in% res$last]
            if(nrow(x)>0) {
                setorder(x,-n)
                x[,frq:=frq*0.4*0.4]
                res = rbind(res,x[1:10,c("last","frq")])
                setorder(res,-frq)
                res = res[!is.na(res$frq)]
                res = res[frq>0]
                if (nrow(res)>5) {
                    break
                }                 
            } else {
                x = n1[1:10,c("word","frq")]
                x[,frq:=frq*0.4*0.4*0.4]
                colnames(x) = c("last","frq")
                x = x[!last %in% res$last]
                res = rbind(res,x)
                break
            }            
        }
    }
    setorder(res,-frq)
    colnames(res) = c("Candidate","Score")
    res[1:5]
}

