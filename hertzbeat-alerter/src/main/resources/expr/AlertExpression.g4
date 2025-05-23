/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

grammar AlertExpression;

expression
    : expr EOF
    ;

expr
    : '(' expr ')'                       # ParenExpr
    | left=expr op=('>='|'<='|'>'|'<'|'=='|'!=') right=expr  # ComparisonExpr
    | left=expr 'and' right=expr         # AndExpr
    | left=expr 'unless' right=expr      # UnlessExpr
    | left=expr 'or' right=expr          # OrExpr
    | identifier                         # QueryExpr
    | number                             # LiteralExpr
    ;

// Lexer rules
AND     : 'and' ;
OR      : 'or' ;
UNLESS  : 'unless' ;
GT      : '>' ;
GE      : '>=' ;
LT      : '<' ;
LE      : '<=' ;
EQ      : '==' ;
NE      : '!=' ;
LPAREN  : '(' ;
RPAREN  : ')' ;

identifier
    : IDENTIFIER
    ;

number
    : NUMBER
    ;

IDENTIFIER : [a-zA-Z_] [a-zA-Z0-9_=～{}[\]".]*;
NUMBER     : [0-9]+ ('.' [0-9]+)? ;
WS         : [ \t\r\n]+ -> skip ;