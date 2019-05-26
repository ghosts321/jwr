package com.wr4.page;
public class OracleDialect extends Dialect{    
    
    /* (non-Javadoc)  
     * @see org.mybatis.extend.interceptor.IDialect#getLimitString(java.lang.String, int, int)  
     */    
        
    public String getLimitString(String sql, int offset, int limit) {    
    
        sql = sql.trim();    
        StringBuffer pagingSelect = new StringBuffer(sql.length() + 100);    
            
        pagingSelect.append("select * from ( select row_.*, rownum rownum_ from ( ");    
            
        pagingSelect.append(sql);    
            
        pagingSelect.append(" ) row_ ) where rownum_ > ").append(offset).append(" and rownum_ <= ").append(limit);    
            
        return pagingSelect.toString();    
    }    
    
}    