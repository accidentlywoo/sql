SELECT WAREKY,
		       EXPTNK,
		       NAME01,
		       SUM(RCPT_CNT) AS RCPT_CNT,
		       SUM(RCPT_CNT_SUM) AS RCPT_CNT_SUM,
		       SUM(A) AS A,
		       SUM(B) AS B,
		       SUM(A)+SUM(B) AS AB,
		       SUM(C) AS C,
		       SUM(D) AS D,
		       SUM(E) AS E,
		       SUM(F) AS F,
		       SUM(G) AS G,
		       SUM(H) AS H,
		       SUM(I) AS I,
		       SUM(J) AS J,
		       SUM(K) AS K,
		       SUM(L) AS L,
		       SUM(M) AS M,
		       SUM(N) AS N,
		       
		       SUM(O) AS O,
		       WADN01,
               NAME03,
               EXCOMK
		  FROM ( SELECT WAREKY,
		                EXPTNK,
		                NAME01,
		                RCPT_CNT,
		                RCPT_CNT_SUM,
		                
		                A,			
		                B,			
		                
		                ROUND( E / 1.1 ) AS C,								
		                ( E - ROUND( E / 1.1 ) ) AS D,						
		                E,													
		                
		                ROUND( H / 1.1 ) AS F,								
		                ( H - ROUND( H / 1.1 ) ) AS G,						
		                H,													
		                
		                ROUND( K * WTOPPM / 100 ) AS I,						
		                ( K - ROUND( K * WTOPPM / 100 ) ) AS J,				
		                K,													
		                
		                ROUND( A * WTOPPM / 100 ) AS L,											
		                ( ROUND( B * WTOPPM / 100 ) - ( K - ROUND( K * WTOPPM / 100 ) ) ) AS M,	
		                ( H - ( K - ROUND( K * WTOPPM / 100 ) ) ) AS N,						
		                
		                
		                ( E - K - ( H - ( K - ROUND( K * WTOPPM / 100 ) ) ) ) AS O,			
		                WADN01,
                        NAME03,
                        EXCOMK
		           FROM (SELECT WAREKY,
		                        EXPTNK,
		                        NAME01,
		                        RTYP,
		                        WTOPPM,
		                        
		                        NVL(COUNT(PAYAMT), 0) AS RCPT_CNT,
		                        NVL(SUM(QTYORG), 0) AS RCPT_CNT_SUM,
		                        
		                        NVL(SUM(PAYAMT1), 0) AS A,
		                        NVL(SUM(PAYAMT2), 0) AS B,
		                        
		                        ( NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) ) AS E,
		                        CASE WHEN RTYP = 'ALL' THEN ROUND((NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) ) * WTOPPM / 100 )
		                             ELSE ROUND(( ( NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) ) * WTOPPM / 100 ) + ( ( NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) ) * WTOPPM / 100 )*0.01)
		                             END AS H,
		                        ROUND( NVL(SUM(PAYAMT2), 0) * 10 / 100 ) AS K,
		                        WADN01,
		                        NAME03,
		                        EXCOMK
		                   FROM (SELECT BP.WAREKY,
		                                BP.EXPTNK,
		                                BP.NAME01,
		                                P.PAYAMT,
		                                OI.QTYORG,
		                                OH.STATDO,
		                                BP.WTOPPM,
		                                
		                                CASE WHEN P.PAYMET = '1' THEN PAYAMT END AS PAYAMT1,
		                                CASE WHEN P.PAYMET = '2' THEN PAYAMT END AS PAYAMT2,
		                                
		                                CASE WHEN P.PAYMET = '1' THEN QTYORG END AS QTYORG1,
		                                CASE WHEN P.PAYMET = '2' THEN QTYORG END AS QTYORG2,
		                                
		                                CASE WHEN RD.ROUTKY IS NULL THEN 'ONE' ELSE 'ALL' END AS RTYP,
		                                WA.WADN01,
		                                WA.NAME03,
		                                WA.EXCOMK
				                   FROM ORDDH OH,
				                        ORDDI OI,
		                                BZPTN BP,
		                                WAHMA WA,
		                                ROTDI RI LEFT JOIN (SELECT DISTINCT A.ROUTKY, A.DTTMKY
		                                                      FROM ROTDH A, ROTDI B
		                                                     WHERE A.ROUTKY = B.ROUTKY
		                                                       AND A.DTTMKY = B.DTTMKY
		                                                       AND A.WAREKY = 'W002'
		                                                       AND B.TRPCMP != '01') RD
		                                           ON RI.ROUTKY = RD.ROUTKY
		                                          AND RI.DTTMKY = RD.DTTMKY,
				                        (SELECT ORDKEY, APDTRC, APPNUM, CARCNB, CREDAT, PAYAMT, PAYMET
				                           FROM (SELECT ORDKEY, APDTRC, APPNUM, CARCNB, CREDAT, PAYAMT, PAYMET,
				                                        ROW_NUMBER() OVER(PARTITION BY ORDKEY ORDER BY PAYKEY DESC)  RNUM 
				                                   FROM PAYDH
				                                ) 
		                                  WHERE RNUM = 1
				                        ) P
				                  WHERE OH.WAREKY = 'W001'
				                    AND OH.OWNRKY = 'CC'
				                    AND WA.WAREKY = 'W001'
				                    AND OH.ORDKEY = OI.ORDKEY
				                    AND OH.ALOCKY = RI.ALOCKY
				                    AND RI.TRPCMP = BP.EXPTNK
				                    AND OH.WAREKY = BP.WAREKY
				                    AND OH.STATDO != ' '
				                    AND OI.ORDKEY = P.ORDKEY
				                    
							        	AND RI.TRPCMP = '01'
							        
				                    
								  		AND TO_CHAR(TO_DATE(OH.STRDAT, 'YYYYMMDD'), 'YYYYMMDD') = TO_CHAR(TO_DATE('20190101', 'YYYYMMDD'), 'YYYYMMDD')
								  	
									
								  	
		                         ) 
		                  GROUP BY WAREKY, EXPTNK, NAME01, WTOPPM, RTYP,WADN01,NAME03,EXCOMK
		                )
		       ) 
		 GROUP BY WAREKY, EXPTNK, NAME01,WADN01,NAME03,EXCOMK;
         
         
         SELECT WAREKY,
                EXPTNK,
                NAME01,
                RCPT_CNT,
                RCPT_CNT_SUM,
                
                A,			-- 매출내역 : 현금 -->
                ( ROUND( B * WTOPPM / 100 ) - ( K - ROUND( K * WTOPPM / 100 ) ) ) AS B,	-- 카드미지급
                A+( ROUND( B * WTOPPM / 100 ) - ( K - ROUND( K * WTOPPM / 100 ) ) ) AS AB, -- 합계
                
                ROUND( E / 1.1 )-( ROUND( B * WTOPPM / 100 ) + ( K - ROUND( K * WTOPPM / 100 ) ) )AS C,--카드 지급
                
                
                ( E - ROUND( E / 1.1 ) ) AS D,						-- 매출내역 : 매출합계 VAT -->
                E,													-- 매출내역 : 계 -->
                
                ROUND( H / 1.1 ) AS F,								-- 공제내역 : 차량이용수수료 : 수수료 -->
                ( H - ROUND( H / 1.1 ) ) AS G,						-- 공제내역 : 차량이용수수료 : VAT -->
                H,													-- 공제내역 : 차량이용수수료 : 계 -->
                
                ROUND( K * WTOPPM / 100 ) AS I,						-- 공제내역 : 신용카드 가맹점 수수료 : 당사 -->
                ( K - ROUND( K * WTOPPM / 100 ) ) AS J,				-- 공제내역 : 신용카드 가맹점 수수료 : 고속사 -->
                K,													-- 공제내역 : 신용카드 가맹점 수수료 : 계 -->
                
                ROUND( A * WTOPPM / 100 ) AS L,											-- 공제내역 : 고속사지급액 : 현금 -->
                ( ROUND( B * WTOPPM / 100 ) - ( K - ROUND( K * WTOPPM / 100 ) ) ) AS M,	-- 공제내역 : 고속사지급액 : 신용카드(미지급) -->
                ( H - ( K - ROUND( K * WTOPPM / 100 ) ) ) AS N,						-- 공제내역 : 고속사지급액 : 계 -->
                -- ( ( A * WTOPPM / 100 ) + ( B * WTOPPM / 100 ) - ( K - ROUND( K * WTOPPM / 100 ) ) ) AS N2, -->
                
                ( E - K - ( H - ( K - ROUND( K * WTOPPM / 100 ) ) ) ) AS O,			-- 정산급액(당사수익) -->
                WADN01,
                NAME03,
                EXCOMK
           FROM (SELECT WAREKY,
                        EXPTNK,
                        NAME01,
                        RTYP,
                        WTOPPM,
                        
                        NVL(COUNT(PAYAMT), 0) AS RCPT_CNT,
                        NVL(SUM(QTYORG), 0) AS RCPT_CNT_SUM,
                        
                        NVL(SUM(PAYAMT1), 0) AS A,
                        NVL(SUM(PAYAMT2), 0) AS B,
                        
                        ( NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) ) AS E,
                        CASE WHEN RTYP = 'ALL' THEN ROUND((NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) ) * WTOPPM / 100 )
                             ELSE ROUND(( ( NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) ) * WTOPPM / 100 ) + ( ( NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) ) * WTOPPM / 100 )*0.01)
                             END AS H,
                        ROUND( NVL(SUM(PAYAMT2), 0) * 10 / 100 ) AS K,
                        WADN01,
                        NAME03,
                        EXCOMK
                   FROM (SELECT BP.WAREKY,
                                BP.EXPTNK,
                                BP.NAME01,
                                P.PAYAMT,
                                OI.QTYORG,
                                OH.STATDO,
                                BP.WTOPPM,
                                
                                CASE WHEN P.PAYMET = '1' THEN PAYAMT END AS PAYAMT1,
                                CASE WHEN P.PAYMET = '2' THEN PAYAMT END AS PAYAMT2,
                                
                                CASE WHEN P.PAYMET = '1' THEN QTYORG END AS QTYORG1,
                                CASE WHEN P.PAYMET = '2' THEN QTYORG END AS QTYORG2,
                                
                                CASE WHEN RD.ROUTKY IS NULL THEN 'ONE' ELSE 'ALL' END AS RTYP,
                                WA.WADN01,
                                WA.NAME03,
                                WA.EXCOMK
                           FROM ORDDH OH,
                                ORDDI OI,
                                BZPTN BP,
                                WAHMA WA,
                                ROTDI RI LEFT JOIN (SELECT DISTINCT A.ROUTKY, A.DTTMKY
                                                      FROM ROTDH A, ROTDI B
                                                     WHERE A.ROUTKY = B.ROUTKY
                                                       AND A.DTTMKY = B.DTTMKY
                                                       AND A.WAREKY = 'W001'
                                                       AND B.TRPCMP != '01') RD
                                           ON RI.ROUTKY = RD.ROUTKY
                                          AND RI.DTTMKY = RD.DTTMKY,
                                (SELECT ORDKEY, APDTRC, APPNUM, CARCNB, CREDAT, PAYAMT, PAYMET
                                   FROM (SELECT ORDKEY, APDTRC, APPNUM, CARCNB, CREDAT, PAYAMT, PAYMET,
                                                ROW_NUMBER() OVER(PARTITION BY ORDKEY ORDER BY PAYKEY DESC)  RNUM 
                                           FROM PAYDH
                                        ) 
                                  WHERE RNUM = 1
                                ) P
                          WHERE OH.WAREKY = 'W001'
                            AND OH.OWNRKY = 'CC'
                            AND WA.WAREKY = 'W001'
                            AND OH.ORDKEY = OI.ORDKEY
                            AND OH.ALOCKY = RI.ALOCKY
                            AND RI.TRPCMP = BP.EXPTNK
                            AND OH.WAREKY = BP.WAREKY
                            AND OH.STATDO != ' '
                            AND OI.ORDKEY = P.ORDKEY
                             ) 
		                  GROUP BY WAREKY, EXPTNK, NAME01, WTOPPM, RTYP,WADN01,NAME03,EXCOMK
		                )
		       ) 
		 GROUP BY WAREKY, EXPTNK, NAME01,WADN01,NAME03,EXCOMK;
         
         
         SELECT WAREKY,
		       EXPTNK,
		       NAME01,
		       SUM(RCPT_CNT) AS RCPT_CNT,
		       SUM(RCPT_CNT_SUM) AS RCPT_CNT_SUM,
		       SUM(A) AS A,
		       SUM(B) AS B,
		       SUM(A)+SUM(B) AS AB,
		       SUM(C) AS C,
		       SUM(D) AS D,
		       SUM(E) AS E,
		       SUM(F) AS F,
               
               
		       SUM(G) AS G,
		       SUM(A)+SUM(C)-SUM(D)-SUM(G) AS H,
		
		       WADN01,
               NAME03,
               EXCOMK
		  FROM ( SELECT WAREKY,
		                EXPTNK,
		                NAME01,
		                RCPT_CNT,
		                RCPT_CNT_SUM,
		                
		                A,			
		               ( ROUND( B * WTOPPM / 100 ) - ( K - ROUND( K * WTOPPM / 100 ) ) ) AS B,	-- 카드미지급                        
                        
                        ROUND( E / 1.1 )-( ROUND( B * WTOPPM / 100 ) + ( K - ROUND( K * WTOPPM / 100 ) ) )AS C,--카드 지급							
		                D,						
		                ROUND(D/1.1) AS E,													
		                
		                D-ROUND(D/1.1) AS F,
                        K- ROUND( K * WTOPPM / 100 ) AS K,
                        K/10000 AS K2,
		                B*(K / 10000) AS G,
                        --K카드수수료?		                
		                WADN01,
                        NAME03,
                        EXCOMK
		           FROM (SELECT WAREKY,
		                        EXPTNK,
		                        NAME01,
		                        RTYP,
		                        WTOPPM,
		                        
		                        NVL(COUNT(PAYAMT), 0) AS RCPT_CNT,
		                        NVL(SUM(QTYORG), 0) AS RCPT_CNT_SUM,
		                        
		                        NVL(SUM(PAYAMT1), 0) AS A,
		                        NVL(SUM(PAYAMT2), 0) AS B,
		                        
		                        ( NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) )*WTOPPM / 100 AS D,
                                ( NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) ) AS E,
		                       
		                        ROUND( NVL(SUM(PAYAMT2), 0) * 10 / 100 ) AS K,
		                        WADN01,
		                        NAME03,
		                        EXCOMK
		                   FROM (SELECT BP.WAREKY,
		                                BP.EXPTNK,
		                                BP.NAME01,
		                                P.PAYAMT,
		                                OI.QTYORG,
		                                OH.STATDO,
		                                BP.WTOPPM,
		                                
		                                CASE WHEN P.PAYMET = '1' THEN PAYAMT END AS PAYAMT1,
		                                CASE WHEN P.PAYMET = '2' THEN PAYAMT END AS PAYAMT2,
		                                
		                                CASE WHEN P.PAYMET = '1' THEN QTYORG END AS QTYORG1,
		                                CASE WHEN P.PAYMET = '2' THEN QTYORG END AS QTYORG2,
		                                
		                                CASE WHEN RD.ROUTKY IS NULL THEN 'ONE' ELSE 'ALL' END AS RTYP,
		                                WA.WADN01,
		                                WA.NAME03,
		                                WA.EXCOMK
				                   FROM ORDDH OH,
				                        ORDDI OI,
		                                BZPTN BP,
		                                WAHMA WA,
		                                ROTDI RI LEFT JOIN (SELECT DISTINCT A.ROUTKY, A.DTTMKY
		                                                      FROM ROTDH A, ROTDI B
		                                                     WHERE A.ROUTKY = B.ROUTKY
		                                                       AND A.DTTMKY = B.DTTMKY
		                                                       AND A.WAREKY = 'W001'
		                                                       AND B.TRPCMP != '01') RD
		                                           ON RI.ROUTKY = RD.ROUTKY
		                                          AND RI.DTTMKY = RD.DTTMKY,
				                        (SELECT ORDKEY, APDTRC, APPNUM, CARCNB, CREDAT, PAYAMT, PAYMET
				                           FROM (SELECT ORDKEY, APDTRC, APPNUM, CARCNB, CREDAT, PAYAMT, PAYMET,
				                                        ROW_NUMBER() OVER(PARTITION BY ORDKEY ORDER BY PAYKEY DESC)  RNUM 
				                                   FROM PAYDH
				                                ) 
		                                  WHERE RNUM = 1
				                        ) P
				                  WHERE OH.WAREKY = 'W001'
				                    AND OH.OWNRKY = 'CC'
				                    AND WA.WAREKY = 'W001'
				                    AND OH.ORDKEY = OI.ORDKEY
				                    AND OH.ALOCKY = RI.ALOCKY
				                    AND RI.TRPCMP = BP.EXPTNK
				                    AND OH.WAREKY = BP.WAREKY
				                    AND OH.STATDO != ' '
				                    AND OI.ORDKEY = P.ORDKEY
				                    
							        	AND RI.TRPCMP = '01'
							        
				                    
								  		AND TO_CHAR(TO_DATE(OH.STRDAT, 'YYYYMMDD'), 'YYYYMMDD') = TO_CHAR(TO_DATE('20190101', 'YYYYMMDD'), 'YYYYMMDD')
								  	
									
								  	
		                         ) 
		                  GROUP BY WAREKY, EXPTNK, NAME01, WTOPPM, RTYP,WADN01,NAME03,EXCOMK
		                )
		       ) 
		 GROUP BY WAREKY, EXPTNK, NAME01,WADN01,NAME03,EXCOMK;
         
SELECT WAREKY,
		       EXPTNK,
		       NAME01,
		       SUM(RCPT_CNT) AS RCPT_CNT,
		       SUM(RCPT_CNT_SUM) AS RCPT_CNT_SUM,
		       SUM(A) AS A,
		       SUM(B) AS B,
		       SUM(A)+SUM(B) AS AB,
		       SUM(C) AS C,
		       SUM(D) AS D,
		       SUM(E) AS E,
		       SUM(F) AS F,
               
               
		       SUM(G) AS G,
		       SUM(A)+SUM(C)-SUM(D)-SUM(G) AS H,
		
		       WADN01,
               NAME03,
               EXCOMK
		  FROM ( SELECT WAREKY,
		                EXPTNK,
		                NAME01,
		                RCPT_CNT,
		                RCPT_CNT_SUM,
		                
		                A,			
		               ( ROUND( B * WTOPPM / 100 ) - ( K - ROUND( K * WTOPPM / 100 ) ) ) AS B,	-- 카드미지급                        
                        
                        ROUND( E / 1.1 )-( ROUND( B * WTOPPM / 100 ) + ( K - ROUND( K * WTOPPM / 100 ) ) )AS C,--카드 지급							
		                D,						
		                ROUND(D/1.1) AS E,													
		                
		                D-ROUND(D/1.1) AS F,
                        K- ROUND( K * WTOPPM / 100 ) AS K,
                        K/10000 AS K2,
		                B*(K / 10000) AS G,
                        --K카드수수료'CC'		                
		                WADN01,
                        NAME03,
                        EXCOMK
		           FROM (SELECT WAREKY,
		                        EXPTNK,
		                        NAME01,
		                        RTYP,
		                        WTOPPM,
		                        
		                        NVL(COUNT(PAYAMT), 0) AS RCPT_CNT,
		                        NVL(SUM(QTYORG), 0) AS RCPT_CNT_SUM,
		                        
		                        NVL(SUM(PAYAMT1), 0) AS A,
		                        NVL(SUM(PAYAMT2), 0) AS B,
		                        
		                        ( NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) )*WTOPPM / 100 AS D,
                                ( NVL(SUM(PAYAMT1), 0) + NVL(SUM(PAYAMT2), 0) ) AS E,
		                        ROUND( NVL(SUM(PAYAMT2), 0) * 10 / 100 ) AS K,
		                        WADN01,
		                        NAME03,
		                        EXCOMK
		                   FROM (SELECT BP.WAREKY,
		                                BP.EXPTNK,
		                                BP.NAME01,
		                                P.PAYAMT,
		                                OI.QTYORG,
		                                OH.STATDO,
		                                BP.WTOPPM,
		                                
		                                CASE WHEN P.PAYMET = '1' THEN PAYAMT END AS PAYAMT1,
		                                CASE WHEN P.PAYMET = '2' THEN PAYAMT END AS PAYAMT2,
		                                
		                                CASE WHEN P.PAYMET = '1' THEN QTYORG END AS QTYORG1,
		                                CASE WHEN P.PAYMET = '2' THEN QTYORG END AS QTYORG2,
		                                
		                                CASE WHEN RD.ROUTKY IS NULL THEN 'ONE' ELSE 'ALL' END AS RTYP,
		                                WA.WADN01,
		                                WA.NAME03,
		                                WA.EXCOMK
				                   FROM ORDDH OH,
				                        ORDDI OI,
		                                BZPTN BP,
		                                WAHMA WA,
		                                ROTDI RI LEFT JOIN (SELECT DISTINCT A.ROUTKY, A.DTTMKY
		                                                      FROM ROTDH A, ROTDI B
		                                                     WHERE A.ROUTKY = B.ROUTKY
		                                                       AND A.DTTMKY = B.DTTMKY
		                                                       AND A.WAREKY = 'W001'
		                                                       AND B.TRPCMP != '01') RD
		                                           ON RI.ROUTKY = RD.ROUTKY
		                                          AND RI.DTTMKY = RD.DTTMKY,
				                        (SELECT ORDKEY, APDTRC, APPNUM, CARCNB, CREDAT, PAYAMT, PAYMET
				                           FROM (SELECT ORDKEY, APDTRC, APPNUM, CARCNB, CREDAT, PAYAMT, PAYMET,
				                                        ROW_NUMBER() OVER(PARTITION BY ORDKEY ORDER BY PAYKEY DESC)  RNUM 
				                                   FROM PAYDH
				                                ) 
		                                  WHERE RNUM = 1
				                        ) P
				                  WHERE OH.WAREKY = 'W001'
				                    AND OH.OWNRKY = 'CC'
				                    AND WA.WAREKY = 'W001'
				                    AND OH.ORDKEY = OI.ORDKEY
				                    AND OH.ALOCKY = RI.ALOCKY
				                    AND RI.TRPCMP = BP.EXPTNK
				                    AND OH.WAREKY = BP.WAREKY
				                    AND OH.STATDO != ' '
				                    AND OI.ORDKEY = P.ORDKEY
				                    
				                    
									
								  	
		                         ) 
		                  GROUP BY WAREKY, EXPTNK, NAME01, WTOPPM, RTYP,WADN01,NAME03,EXCOMK
		                )
		       ) 
		 GROUP BY WAREKY, EXPTNK, NAME01,WADN01,NAME03,EXCOMK