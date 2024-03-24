Class {
	#name : #SyntaxJsonToFASTTests,
	#superclass : #AbstractJsonToFASTTests,
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #'as yet unclassified' }
SyntaxJsonToFASTTests class >> generateFortranSourcesFromTests [

	| fileName filePath |
	filePath := (FileLocator workingDirectory / 'tests')
		            ensureCreateDirectory pathString.
	self methods do: [ :method | "if the methos is a test"
		(method selector includesSubstring: 'test') ifTrue: [
			fileName := (filePath , '/' , method selector , '.FOR')
				            asFileReference.
			fileName writeStreamDo: [ :stream |
				stream nextPutAll: (method ast body statements detect: [ :stmt |
						 stmt class = RBAssignmentNode and: [
							 stmt variable name = 'fortranCode' ] ]) value value ] ] ]
]

{ #category : #'as yet unclassified' }
SyntaxJsonToFASTTests class >> generateTestsFortranSources [

	| directory method stream |
	directory := FileLocator workingDirectory / 'pharo'.

	directory files do: [ :file |
		| selector |
		selector := file basenameWithoutExtension asSymbol.

		(SyntaxJsonToFASTTests includesSelector: selector) ifTrue: [
			| fortranCode jsonCode |
			
			fortranCode := (((SyntaxJsonToFASTTests compiledMethodAt: selector)
				                method ast body statements detect: [ :stmt |
				                stmt class = RBAssignmentNode and: [
					                stmt variable name = 'fortranCode' ] ]) value
				               value) copyReplaceAll: '''' with: ''''''.

			jsonCode := file contents copyReplaceAll: '''' with: ''''''.

			stream := WriteStream on: String new.
			stream
				nextPutAll: selector;
				nextPutAll: '
		| result |
	
	fortranCode := ''';
				nextPutAll: fortranCode;
				nextPutAll: ' ''.
	jsonCode := ''';
				nextPutAll: jsonCode;
				nextPutAll: '''.
	result := self visitJsonCode.	
		'.

			method := stream contents.
			self compile: method ] ]
]

{ #category : #running }
SyntaxJsonToFASTTests >> jsonVisitor [

	^ FASTFortranSyntaxJsonVisitor 
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testArrayAccess [
	
	| result stmt arrayAccess |
	fortranCode := '      PROGRAM MYPROG
      integer arr(10)
		v = arr(1,i)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/array-access.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "variable_declaration_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "INTEGER"
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "name": "ARR"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "19"
                                        },
                                        "value": "10"
                                    }
                                }
                            ]
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "3",
                                "column": "7"
                            },
                            "name": "V"
                        }
                    ],
                    "right": [
                        {
                            "tag": "array_element_name",
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "3",
                                    "column": "11"
                                },
                                "name": "ARR"
                            },
                            "qualifiers_list": [
                                {
                                    "tag": "arithmetic_expression",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "15"
                                        },
                                        "value": "1"
                                    }
                                },
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "17"
                                    },
                                    "name": "I"
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements second.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	arrayAccess := stmt expression.
	self assert: arrayAccess class equals: FASTFortranArrayVariable.
	self assert: arrayAccess name class equals: FASTFortranCharacterLiteral. 
	self assert: arrayAccess name primitiveValue equals: 'ARR'.
	self assert: arrayAccess indices size equals: 2.

	self assert: arrayAccess indices first class equals: FASTFortranIntegerLiteral.
	self assert: arrayAccess indices second class equals: FASTFortranScalarVariable.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testArrayDeclaration [
	
	| result stmt declarator |
	fortranCode := '      PROGRAM MYPROG
      integer arr(10)
      END
'.
	jsonCode := '
	{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/array-access.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "variable_declaration_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "INTEGER"
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "name": "ARR"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "19"
                                        },
                                        "value": "10"
                                    }
                                }
                            ]
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "3",
                                "column": "7"
                            },
                            "name": "V"
                        }
                    ],
                    "right": [
                        {
                            "tag": "array_element_name",
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "3",
                                    "column": "11"
                                },
                                "name": "ARR"
                            },
                            "qualifiers_list": [
                                {
                                    "tag": "arithmetic_expression",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "15"
                                        },
                                        "value": "1"
                                    }
                                },
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "17"
                                    },
                                    "name": "I"
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt declarators size equals: 1.

	declarator := stmt declarators first.
	self assert: declarator variable class equals: FASTFortranVariable.
	self assert: declarator variable name equals: 'ARR'.
	self assert: declarator dimensions size equals: 1.
	self assert: declarator dimensions first class equals: FASTFortranArrayRange. 
	self assert: declarator dimensions first lowerBound equals: nil. 
	self assert: declarator dimensions first upperBound class equals: FASTFortranIntegerLiteral.
	self assert: declarator dimensions first upperBound primitiveValue equals: '10'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testArrayDeclarationDimensionsWithOperation [
	
	| result stmt declarator |
	fortranCode := '      PROGRAM MYPROG
      integer arr(0:max-1)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testArrayDeclarationDimensionsWithOperation.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "variable_declaration_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "INTEGER"
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "name": "ARR"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "19"
                                            },
                                            "value": "0"
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "binary_expression",
                                        "lhs": {
                                            "tag": "variable_expression",
                                            "variable": {
                                                "tag": "symbolic_name",
                                                "start_pos": {
                                                    "line": "2",
                                                    "column": "21"
                                                },
                                                "name": "MAX"
                                            }
                                        },
                                        "operator": "-",
                                        "rhs": {
                                            "tag": "literal_expression",
                                            "literal": {
                                                "tag": "unsigned_int_constant",
                                                "start_pos": {
                                                    "line": "2",
                                                    "column": "25"
                                                },
                                                "value": "1"
                                            }
                                        }
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt declarators size equals: 1.

	declarator := stmt declarators first.

	self assert: declarator dimensions first lowerBound class equals: FASTFortranIntegerLiteral.
	self assert: declarator dimensions first lowerBound primitiveValue equals: '0'.

	self assert: declarator dimensions first upperBound class equals: FASTFortranBinaryExpression.
	self assert: declarator dimensions first upperBound left class equals: FASTFortranScalarVariable.
	self assert: declarator dimensions first upperBound left name equals: 'MAX'.

	self assert: declarator dimensions first upperBound operator equals: '-'.

	self assert: declarator dimensions first upperBound right class equals: FASTFortranIntegerLiteral.
	self assert: declarator dimensions first upperBound right primitiveValue equals: '1'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testArrayDeclarationImplicitLower [
	
	| result stmt declarator |
	fortranCode := '      PROGRAM MYPROG
      integer arr(-5:5)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testArrayDeclarationImplicitLower.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "INTEGER"
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "name": "ARR"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "unary_expression",
                                        "operator": "-",
                                        "expression": {
                                            "tag": "literal_expression",
                                            "literal": {
                                                "tag": "unsigned_int_constant",
                                                "start_pos": {
                                                    "line": "2",
                                                    "column": "20"
                                                },
                                                "value": "5"
                                            }
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "22"
                                            },
                                            "value": "5"
                                        }
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt declarators size equals: 1.

	declarator := stmt declarators first.
	self assert: declarator variable name equals: 'ARR'.
	self assert: declarator dimensions size equals: 1.
	self assert: declarator dimensions first lowerBound class equals: FASTFortranIntegerLiteral.
	self assert: declarator dimensions first lowerBound primitiveValue equals: '-5'.
	self assert: declarator dimensions first upperBound class equals: FASTFortranIntegerLiteral.
	self assert: declarator dimensions first upperBound primitiveValue equals: '5'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testArrayDeclarationMultipleDimensions [
	
	| result stmt declarator |
	fortranCode := '      PROGRAM MYPROG
      integer arr(1:10 , 0:5)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testArrayDeclarationMultipleDimensions.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "INTEGER"
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "name": "ARR"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "19"
                                            },
                                            "value": "1"
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "21"
                                            },
                                            "value": "10"
                                        }
                                    }
                                },
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "26"
                                            },
                                            "value": "0"
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "28"
                                            },
                                            "value": "5"
                                        }
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt declarators size equals: 1.

	declarator := stmt declarators first.
	self assert: declarator variable name equals: 'ARR'.
	self assert: declarator dimensions size equals: 2.

	self assert: declarator dimensions first lowerBound primitiveValue equals: '1'.
	self assert: declarator dimensions first upperBound primitiveValue equals: '10'.

	self assert: declarator dimensions second lowerBound primitiveValue equals: '0'.
	self assert: declarator dimensions second upperBound primitiveValue equals: '5'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testArrayDeclarationThreeDimensions [
	
	| result stmt arrA arrB arrayAccess |
	fortranCode := '
      REAL A(3:5, 7, 3:5), B(0:2)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/array-multidimenstion.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
				"parameters": [],
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "variable_declaration_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "REAL"
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "12"
                                },
                                "name": "A"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "14"
                                            },
                                            "value": "3"
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "16"
                                            },
                                            "value": "5"
                                        }
                                    }
                                },
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "19"
                                            },
                                            "value": "7"
                                        }
                                    }
                                },
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "22"
                                            },
                                            "value": "3"
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "24"
                                            },
                                            "value": "5"
                                        }
                                    }
                                }
                            ]
                        },
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "28"
                                },
                                "name": "B"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "30"
                                            },
                                            "value": "0"
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "32"
                                            },
                                            "value": "2"
                                        }
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: (stmt declarators size) equals: 2.
	
	arrA := stmt declarators first.
	self assert: arrayAccess class equals: FASTFortranArrayVariable.
	self assert: arrayAccess name equals: 'arr'.
	self assert: arrayAccess indices size equals: 2.

	self assert: arrayAccess indices first class equals: FASTFortranIntegerLiteral.
	self assert: arrayAccess indices second class equals: FASTFortranScalarVariable.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testArrayDeclarationVariableBound [
	
	| result stmt declarator |
	fortranCode := '      PROGRAM MYPROG
      integer arr(max)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testArrayDeclarationVariableBound.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "INTEGER"
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "name": "ARR"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "variable_expression",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "19"
                                        },
                                        "name": "MAX"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt declarators size equals: 1.

	declarator := stmt declarators first.
	self assert: declarator variable name equals: 'ARR'.
	self assert: declarator dimensions size equals: 1.
	self assert: declarator dimensions first class equals: FASTFortranArrayRange. 
	self assert: declarator dimensions first lowerBound equals: nil. 
	self assert: declarator dimensions first upperBound class equals: FASTFortranScalarVariable.
	self assert: declarator dimensions first upperBound name equals: 'MAX'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testAssignement [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = 1
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/assignment.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "8"
                            },
                            "name": "C"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "12"
                                },
                                "value": "1"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	"self assert: stmt startPos equals: 32."
	"self assert: stmt endPos equals: 36".

	self assert: stmt variable class equals: FASTFortranScalarVariable.
	self assert: stmt variable name class equals: FASTFortranCharacterLiteral. 
	self assert: stmt variable name primitiveValue equals: 'C'.
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testAssignementBooleanLiteral [

	| stmt main result |
	fortranCode := '      PROGRAM MYPROG
          c = .true.
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testAssignementBooleanLiteral.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "11"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "11"
                            },
                            "name": "C"
                        }
                    ],
                    "right": [
                        {
                            "tag": "logical_expression",
                            "expression": {
                                "tag": "logical_factor",
                                "negated": "false",
                                "expression": {
                                    "tag": "logical_primary",
                                    "expression": {
                                        "tag": "logical_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "15"
                                        },
                                        "value": ".TRUE."
                                    }
                                }
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	main := self visitJsonCode.
	
	self assert: main class equals: FASTFortranProgramMain.
	self assert: main statementBlock class equals: FASTFortranStatementBlock.
	
	stmt := main statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	"self assert: stmt startPos equals: 32."

	self assert: stmt expression class equals: FASTFortranBooleanLiteral.
	self assert: stmt expression primitiveValue equals: true.
	"self assert: stmt expression startPos equals: 36."

]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testAssignementFunctionCall [

	| stmt main result |
	fortranCode := '      PROGRAM MYPROG
          c = fct()
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testAssignementFunctionCall.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "11"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "11"
                            },
                            "name": "C"
                        }
                    ],
                    "right": [
                        {
                            "tag": "function_reference",
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "name": "FCT"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	main := self visitJsonCode.

	self assert: main class equals: FASTFortranProgramMain.
	self assert: main statementBlock class equals: FASTFortranStatementBlock.
	
	stmt := main statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	"self assert: stmt startPos equals: 32."

	self assert: stmt expression class equals: FASTFortranFunctionCall.
	self assert: stmt expression name primitiveValue equals: 'FCT'.
	"self assert: stmt expression startPos equals: 36."

]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testAssignementIntegerLiteral [

	| stmt main result |
	fortranCode := '      PROGRAM MYPROG
          c = 1
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testAssignementIntegerLiteral.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "11"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "11"
                            },
                            "name": "C"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "value": "1"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	main := self visitJsonCode.

	self assert: main class equals: FASTFortranProgramMain.
	self assert: main statementBlock class equals: FASTFortranStatementBlock.
	
	stmt := main statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	"self assert: stmt startPos equals: 32."

	self assert: stmt expression class equals: FASTFortranIntegerLiteral.
	self assert: stmt expression primitiveValue equals: '1'.
	"self assert: stmt expression startPos equals: 36."

]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testAssignementNegativeIntegerLiteral [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
          c = -1
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testAssignementNegativeIntegerLiteral.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "11"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "11"
                            },
                            "name": "C"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "constant_signed",
                                "sign": "-",
                                "constant": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "16"
                                    },
                                    "value": "1"
                                }
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.
	
	stmt := result statementBlock statements first.

	self assert: stmt expression class equals: FASTFortranIntegerLiteral.
	self assert: stmt expression primitiveValue equals: '-1'.

]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testAssignementNegativeRealLiteral [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = -2.12
      END
'.

	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testAssignementNegativeRealLiteral.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "11"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "11"
                            },
                            "name": "C"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "constant_signed",
                                "sign": "-",
                                "constant": {
                                    "tag": "unsigned_real_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "16"
                                    },
                                    "value": "2.12"
                                }
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.

	stmt := result statementBlock statements first.

	self assert: stmt expression class equals: FASTFortranRealLiteral.
	self assert: stmt expression primitiveValue equals: '-2.12'
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testAssignementRealLiteral [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = 2.12
      END
'.

	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testAssignementRealLiteral.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "11"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "11"
                            },
                            "name": "C"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "unsigned_real_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "value": "2.12"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.

	stmt := result statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	"self assert: stmt startPos equals: 32."

	self assert: stmt expression class equals: FASTFortranRealLiteral.
	self assert: stmt expression primitiveValue equals: '2.12'.
	"self assert: stmt expression startPos equals: 36."

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testAssignementScientificNotation [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = 1.0E-30
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testAssignementScientificNotation.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "11"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "11"
                            },
                            "name": "C"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "unsigned_real_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "value": "1.0E-30"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
'.

	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	"self assert: stmt startPos equals: 32."


	self assert: stmt expression class equals: FASTFortranRealLiteral.
	self assert: stmt expression primitiveValue equals: '1.0E-30'.
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testAssignementStringLiteral [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = ''once upon a time there were ''''quotes''''! ''
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testAssignementStringLiteral.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "11"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "11"
                            },
                            "name": "C"
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "value": "once upon a time there were ''''quotes''''! "
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.

	stmt := result statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	"self assert: stmt startPos equals: 32."

	self assert: stmt expression class equals: FASTFortranCharacterLiteral.
	self assert: stmt expression primitiveValue equals: 'once upon a time there were ''''quotes''''! '.
	"self assert: stmt expression startPos equals: 36."

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testAssignementToArrayRange [

	| result stmt var |
	fortranCode := '      PROGRAM MYPROG
      NOMARC(1:1) = ''c''
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testAssignementToArrayRange.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "substring",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "7"
                                },
                                "name": "NOMARC"
                            },
                            "lower_bound": {
                                "tag": "arithmetic_expression",
                                "expression": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "14"
                                    },
                                    "value": "1"
                                }
                            },
                            "upper_bound": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "16"
                                },
                                "value": "1"
                            }
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "21"
                                },
                                "value": "''c''"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.

	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	var := stmt variable.
	self assert: var class equals: FASTFortranArrayVariable.
	self assert: var indices size equals: 1.
	self assert: var indices first class equals: FASTFortranArrayRange.


	self assert: var indices first lowerBound class equals: FASTFortranIntegerLiteral.
	self assert: var indices first lowerBound primitiveValue equals: '1'.
	self assert: var indices first upperBound class equals: FASTFortranIntegerLiteral.
	self assert: var indices first upperBound primitiveValue equals: '1'.
	self assert: var indices first startPos equals: 35.
	self assert: var indices first endPos equals: 37.
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionDivision [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       i = 5 / 6
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionDivision.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "8"
                            },
                            "name": "I"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "binary_expression",
                                "lhs": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "12"
                                    },
                                    "value": "5"
                                },
                                "operator": "/",
                                "rhs": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "16"
                                    },
                                    "value": "6"
                                }
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranAssignmentStatement.

	expr := asnmt expression.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '/'.
	"self assert: expr startPos equals: 33."

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	"self assert: expr leftOperand startPos equals: 33."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	"self assert: expr rightOperand startPos equals: 37."
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionEqKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .eq. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionEqKeyword.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "logical_expression",
                        "expression": {
                            "tag": "logical_factor",
                            "negated": "false",
                            "expression": {
                                "tag": "logical_primary",
                                "expression": {
                                    "tag": "binary_expression",
                                    "lhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "13"
                                        },
                                        "value": "5"
                                    },
                                    "operator": ".EQ.",
                                    "rhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "value": "6"
                                    }
                                }
                            }
                        }
                    },
                    "then_statements": [],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.EQ.'.
	"self assert: expr startPos equals: 34."

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr leftOperand primitiveValue equals: '5'.
	"self assert: expr leftOperand startPos equals: 34."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr rightOperand primitiveValue equals: '6'.
	"self assert: expr rightOperand startPos equals: 41."
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionExponentiation [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       i = 5 ** 6
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionExponentiation.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "8"
                            },
                            "name": "I"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "binary_expression",
                                "lhs": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "12"
                                    },
                                    "value": "5"
                                },
                                "operator": "**",
                                "rhs": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "17"
                                    },
                                    "value": "6"
                                }
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.
	
	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranAssignmentStatement.

	expr := asnmt expression.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '**'.
	"self assert: expr startPos equals: 33."

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	"self assert: expr leftOperand startPos equals: 33."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	"self assert: expr rightOperand startPos equals: 38."
	
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionGtKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .gt. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionGtKeyword.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "logical_expression",
                        "expression": {
                            "tag": "logical_factor",
                            "negated": "false",
                            "expression": {
                                "tag": "logical_primary",
                                "expression": {
                                    "tag": "binary_expression",
                                    "lhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "13"
                                        },
                                        "value": "5"
                                    },
                                    "operator": ".GT.",
                                    "rhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "value": "6"
                                    }
                                }
                            }
                        }
                    },
                    "then_statements": [],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.GT.'.
	"self assert: expr startPos equals: 34."

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr leftOperand primitiveValue equals: '5'.
"	self assert: expr leftOperand startPos equals: 34."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr rightOperand primitiveValue equals: '6'.
	"self assert: expr rightOperand startPos equals: 41."
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionGtSymbol [
	"Note: not valid in Fortran 77"

	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 > 6 ) THEN
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionGtSymbol.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "arithmetic_expression",
                        "expression": {
                            "tag": "unsigned_int_constant",
                            "start_pos": {
                                "line": "2",
                                "column": "13"
                            },
                            "value": "56"
                        }
                    },
                    "then_statements": [],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.GT.'.
	"self assert: expr startPos equals: 34."

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr leftOperand primitiveValue equals: '5'.
	"self assert: expr leftOperand startPos equals: 34."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr rightOperand primitiveValue equals: '6'.
	"self assert: expr rightOperand startPos equals: 38."
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionGteKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .ge. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionGteKeyword.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "logical_expression",
                        "expression": {
                            "tag": "logical_factor",
                            "negated": "false",
                            "expression": {
                                "tag": "logical_primary",
                                "expression": {
                                    "tag": "binary_expression",
                                    "lhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "13"
                                        },
                                        "value": "5"
                                    },
                                    "operator": ".GE.",
                                    "rhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "value": "6"
                                    }
                                }
                            }
                        }
                    },
                    "then_statements": [],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.GE.'.
	"self assert: expr startPos equals: 34."

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr leftOperand primitiveValue equals: '5'.
	"self assert: expr leftOperand startPos equals: 34."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr rightOperand primitiveValue equals: '6'.
	"self assert: expr rightOperand startPos equals: 41."
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionLtKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .Lt. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionLtKeyword.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "logical_expression",
                        "expression": {
                            "tag": "logical_factor",
                            "negated": "false",
                            "expression": {
                                "tag": "logical_primary",
                                "expression": {
                                    "tag": "binary_expression",
                                    "lhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "13"
                                        },
                                        "value": "5"
                                    },
                                    "operator": ".LT.",
                                    "rhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "value": "6"
                                    }
                                }
                            }
                        }
                    },
                    "then_statements": [],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.LT.'.
	"self assert: expr startPos equals: 34."

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr leftOperand primitiveValue equals: '5'.
	"self assert: expr leftOperand startPos equals: 34."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr rightOperand primitiveValue equals: '6'.
	"self assert: expr rightOperand startPos equals: 41."
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionLtSymbol [
	"Note: not valid in Fortran 77"

	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 < 6 ) THEN
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionLtSymbol.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "arithmetic_expression",
                        "expression": {
                            "tag": "unsigned_int_constant",
                            "start_pos": {
                                "line": "2",
                                "column": "13"
                            },
                            "value": "56"
                        }
                    },
                    "then_statements": [],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.lt.'.
	self assert: expr startPos equals: 34.

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr leftOperand primitiveValue equals: '5'.
	self assert: expr leftOperand startPos equals: 34.

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr rightOperand primitiveValue equals: '6'.
	self assert: expr rightOperand startPos equals: 38
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionLteKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .LE. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionLteKeyword.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "logical_expression",
                        "expression": {
                            "tag": "logical_factor",
                            "negated": "false",
                            "expression": {
                                "tag": "logical_primary",
                                "expression": {
                                    "tag": "binary_expression",
                                    "lhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "13"
                                        },
                                        "value": "5"
                                    },
                                    "operator": ".LE.",
                                    "rhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "value": "6"
                                    }
                                }
                            }
                        }
                    },
                    "then_statements": [],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.LE.'.
	"self assert: expr startPos equals: 34."

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr leftOperand primitiveValue equals: '5'.
	"self assert: expr leftOperand startPos equals: 34."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr rightOperand primitiveValue equals: '6'.
	"self assert: expr rightOperand startPos equals: 41."
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionMultiplication [

	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       i = 5 * 6
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionMultiplication.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "8"
                            },
                            "name": "I"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "binary_expression",
                                "lhs": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "12"
                                    },
                                    "value": "5"
                                },
                                "operator": "*",
                                "rhs": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "16"
                                    },
                                    "value": "6"
                                }
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranAssignmentStatement.

	expr := asnmt expression.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '*'.
	"self assert: expr startPos equals: 33."

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	"self assert: expr leftOperand startPos equals: 33."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	"self assert: expr rightOperand startPos equals: 37."
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionNeKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .ne. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionNeKeyword.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "logical_expression",
                        "expression": {
                            "tag": "logical_factor",
                            "negated": "false",
                            "expression": {
                                "tag": "logical_primary",
                                "expression": {
                                    "tag": "binary_expression",
                                    "lhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "13"
                                        },
                                        "value": "5"
                                    },
                                    "operator": ".NE.",
                                    "rhs": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "value": "6"
                                    }
                                }
                            }
                        }
                    },
                    "then_statements": [],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.NE.'.
	"self assert: expr startPos equals: 34."

	self assert: expr leftOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr leftOperand primitiveValue equals: '5'.
	"self assert: expr leftOperand startPos equals: 34."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr rightOperand primitiveValue equals: '6'.
	"self assert: expr rightOperand startPos equals: 41."
]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionSubstraction [
	
	| result expr |
	fortranCode := '      PROGRAM MYPROG
       i = max-1
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionSubstraction.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "8"
                            },
                            "name": "I"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "binary_expression",
                                "lhs": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "12"
                                    },
                                    "name": "MAX"
                                },
                                "operator": "-",
                                "rhs": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "16"
                                    },
                                    "value": "1"
                                }
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	expr := result statementBlock statements first expression.

	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '-'.
	"self assert: expr startPos equals: 33."

	self assert: expr leftOperand class equals: FASTFortranScalarVariable.
	self assert: expr leftOperand name equals: 'max'.
	"self assert: expr leftOperand startPos equals: 33."

	self assert: expr rightOperand class equals: FASTFortranIntegerLiteral.
	self assert: expr rightOperand primitiveValue equals: '1'.
	"self assert: expr rightOperand startPos equals: 37."

]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testBinaryExpressionUnaryMinus [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       i = -i
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBinaryExpressionUnaryMinus.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "8"
                            },
                            "name": "I"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "constant_signed",
                                "sign": "-",
                                "constant": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "13"
                                    },
                                    "name": "I"
                                }
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	asnmt := result statementBlock statements first.
	self assert: asnmt class equals: FASTFortranAssignmentStatement.	
	
	expr := asnmt expression.
	self assert: expr class equals: FASTFortranUnaryExpression.
	self assert: expr operator equals: '-'.
	"self assert: expr startPos equals: 33."

	self assert: expr expression class equals: FASTFortranScalarVariable.
	self assert: expr expression name equals: 'i'.

]

{ #category : #'tests-programUnit' }
SyntaxJsonToFASTTests >> testBlockData [
	| bd |

	fortranCode := '      block data myblck
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testBlockData.FOR",
    "program_units": [
        {
            "tag": "block_data",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "MYBLCK"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": []
        }
    ]
}'.
	bd := self visitJsonCode.

	self assert: bd class equals: FASTFortranBlockData.
	self assert: bd name primitiveValue equals: 'MYBLCK'.
	"self assert: bd startPos equals: 7."

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testCallSubroutine [

	| result call arg |
	fortranCode := '      PROGRAM TESTALT
       CALL RANK ( N, *8 )
      END 
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testCallSubroutine.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "TESTALT"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "call_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "name": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "13"
                        },
                        "name": "RANK"
                    },
                    "arguments": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "20"
                            },
                            "name": "N"
                        },
                        {
                            "tag": "argument_with_return_specifier",
                            "start_pos": {
                                "line": "2",
                                "column": "23"
                            },
                            "return_specifier": "*",
                            "argument": "8"
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first class equals: FASTFortranProgramMain.

	self assert: result first statementBlock statements size equals: 1.

	call := result first statementBlock statements anyOne.
	self assert: call class equals: FASTFortranCallStatement.
	self assert: call name primitiveValue equals: 'RANK'.
	self assert: call arguments size equals: 2.
	"self assert: call startPos equals: 30.
	self assert: call endPos equals: 48."


	arg := call arguments first.
	self assert: arg class equals: FASTFortranScalarVariable.
	self assert: arg name equals: 'N'.

	arg := call arguments second.
	self assert: arg class equals: FASTFortranCharacterLiteral.
	self assert: arg primitiveValue equals: '*8'.
	self flag: 'return specifier type was erased, represented as integer *8'

]

{ #category : #tests }
SyntaxJsonToFASTTests >> testComment [

	| result cmt |
	fortranCode := '      integer function aFct()
C comment in a function''s body
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {
        "2": "C comment in a function''s body\n"
    },
    "file": "test/pharo/testComment.FOR",
    "program_units": [
        {
            "tag": "function",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "24"
                },
                "name": "AFCT"
            },
            "parameters": [],
            "return_type": {
                "tag": "type_reference",
                "name": "INTEGER"
            },
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": []
        }
    ]
}'.

	result := self visitJsonCode.

	cmt := result statementBlock comments anyOne.
	self assert: cmt content equals: 'C comment in a function''s body'.
	self assert: cmt startPos equals: 31.
	self assert: cmt endPos equals: 60.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testCommonStatementMultipleGroups [

	| result stmt commonGroup |
	fortranCode := '      program simplemain
      COMMON / name1 / var1, var2 / name2 / var3, var4
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testCommonStatementMultipleGroups.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "common_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "common_parameters": [
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "16"
                                },
                                "name": "NAME1"
                            },
                            "nlist": [
                                {
                                    "tag": "variable_declarator",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "24"
                                        },
                                        "name": "VAR1"
                                    },
                                    "dimension_declarators": []
                                }
                            ]
                        },
                        {
                            "name": {},
                            "nlist": [
                                {
                                    "tag": "variable_declarator",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "30"
                                        },
                                        "name": "VAR2"
                                    },
                                    "dimension_declarators": []
                                }
                            ]
                        },
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "37"
                                },
                                "name": "NAME2"
                            },
                            "nlist": [
                                {
                                    "tag": "variable_declarator",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "45"
                                        },
                                        "name": "VAR3"
                                    },
                                    "dimension_declarators": []
                                }
                            ]
                        },
                        {
                            "name": {},
                            "nlist": [
                                {
                                    "tag": "variable_declarator",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "51"
                                        },
                                        "name": "VAR4"
                                    },
                                    "dimension_declarators": []
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranCommonStatement.
	"self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 78."

	self assert: stmt groups size equals: 2.

	commonGroup := stmt groups first.
	self assert: commonGroup name equals: 'NAME1'.
	self assert: commonGroup declarators size equals: 2.

	commonGroup := stmt groups second.
	self assert: commonGroup name equals: 'NAME2'.
	self assert: commonGroup declarators size equals: 2.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testCommonStatementNamed [

	| result stmt commonGroup |
	fortranCode := '      program simplemain
      COMMON / name / var1, var2
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testCommonStatementNamed.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "common_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "16"
                                },
                                "name": "NAME"
                            },
                            "nlist": [
                                {
                                    "tag": "variable_declarator",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "23"
                                        },
                                        "name": "VAR1"
                                    },
                                    "dimension_declarators": []
                                }
                            ]
                        },
                        {
                            "name": {},
                            "nlist": [
                                {
                                    "tag": "variable_declarator",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "29"
                                        },
                                        "name": "VAR2"
                                    },
                                    "dimension_declarators": []
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranCommonStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 57.

	self assert: stmt groups size equals: 1.

	commonGroup := stmt groups first.
	self assert: commonGroup name equals: 'name'.
	self assert: commonGroup declarators size equals: 2.
	self assert: commonGroup declarators first startPos equals: 48.
	self assert: commonGroup declarators second startPos equals: 54.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testCommonStatementNoName [

	| result stmt commonGroup |
	fortranCode := '      program simplemain
      COMMON var1, var2
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testCommonStatementNoName.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "common_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": {},
                            "nlist": [
                                {
                                    "tag": "variable_declarator",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "14"
                                        },
                                        "name": "VAR1"
                                    },
                                    "dimension_declarators": []
                                }
                            ]
                        },
                        {
                            "name": {},
                            "nlist": [
                                {
                                    "tag": "variable_declarator",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "name": "VAR2"
                                    },
                                    "dimension_declarators": []
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranCommonStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 48.

	self assert: stmt groups size equals: 1.

	commonGroup := stmt groups first.
	self assert: commonGroup name equals: nil.
	self assert: commonGroup declarators size equals: 2.

	self assert: commonGroup declarators first class equals: FASTFortranVariableDeclarator.
	self assert: commonGroup declarators first variable equals: 'var1'.
	self assert: commonGroup declarators first startPos equals: 39.

	self assert: commonGroup declarators second class equals: FASTFortranVariableDeclarator.
	self assert: commonGroup declarators second variable equals: 'var2'.
	self assert: commonGroup declarators second startPos equals: 45.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testContinueStatement [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
110   CONTINUE
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testContinueStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "label": "110",
                    "tag": "continue_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranContinueStatement.
	"self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 35."

	self assert: stmt label equals: '110'.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDataStatement [

	| result stmt dataGroup |
	fortranCode := '      program simplemain
      DATA chaine1, chaine2  /''Blah'' , ''Deux'' / , chaine3 / ''Encore'' /
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDataStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "data_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "nlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "12"
                                    },
                                    "name": "CHAINE1"
                                },
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "21"
                                    },
                                    "name": "CHAINE2"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "character_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "31"
                                        },
                                        "value": "''Blah''"
                                    }
                                },
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "character_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "40"
                                        },
                                        "value": "''Deux''"
                                    }
                                }
                            ]
                        },
                        {
                            "nlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "51"
                                    },
                                    "name": "CHAINE3"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "character_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "61"
                                        },
                                        "value": "''Encore''"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDataStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 95.

	self assert: stmt variableGroups size equals: 2.

	dataGroup := stmt variableGroups first.
	self assert: dataGroup variables size equals: 2.
	self assert: dataGroup variables first class equals: FASTFortranScalarVariable.
	self assert: dataGroup variables first name equals: 'chaine1'.
	self assert: dataGroup variables first startPos equals: 37.

	self assert: dataGroup dataConstants size equals: 2.
	self assert: dataGroup dataConstants first class equals: FASTFortranCharacterLiteral.
	self assert: dataGroup dataConstants first primitiveValue equals: 'Blah'.
	self assert: dataGroup dataConstants first startPos equals: 56.

	dataGroup := stmt variableGroups second.
	self assert: dataGroup variables size equals: 1.
	self assert: dataGroup variables first class equals: FASTFortranScalarVariable.
	self assert: dataGroup variables first name equals: 'chaine3'.
	self assert: dataGroup variables first startPos equals: 76.

	self assert: dataGroup dataConstants size equals: 1.
	self assert: dataGroup dataConstants first class equals: FASTFortranCharacterLiteral.
	self assert: dataGroup dataConstants first primitiveValue equals: 'Encore'.
	self assert: dataGroup dataConstants first startPos equals: 86.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDeclarationIntegerWithInitializer [

	| result stmt declarator |
	fortranCode := '      program main
      integer i = 1
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDeclarationIntegerWithInitializer.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "7"
                            },
                            "name": "INTEGERI"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "19"
                                },
                                "value": "1"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 34.

	self assert: stmt declarators size equals: 1.
	declarator := stmt declarators anyOne.
	self assert: declarator class equals: FASTFortranVariableDeclarator.
	self assert: declarator variable equals: 'i'.
	self assert: declarator startPos equals: 34.

	self assert: stmt type class equals: FASTFortranIntegerType.
	self assert: stmt type startPos equals: 26.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDimensionStatementAsterisk [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION A(*), B(N,*)
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDimensionStatementAsterisk.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "name": "A"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "asterisk": "*"
                                    }
                                }
                            ]
                        },
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "23"
                                },
                                "name": "B"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "variable_expression",
                                        "variable": {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "25"
                                            },
                                            "name": "N"
                                        }
                                    }
                                },
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "asterisk": "*"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 53.

	self assert: stmt declarators size equals: 2.

	decl := stmt declarators first.
	self assert: decl variable equals: 'a'.
	self assert: decl dimensions size equals: 1.
	self assert: decl dimensions anyOne lowerBound equals: nil. 
	self assert: decl dimensions anyOne upperBound class equals: FASTFortranAsterisk.

	decl := stmt declarators second.
	self assert: decl variable equals: 'b'.
	self assert: decl dimensions size equals: 2.
	self assert: decl dimensions first lowerBound equals: nil. 
	self assert: decl dimensions first upperBound class equals: FASTFortranScalarVariable.
	self assert: decl dimensions second lowerBound equals: nil. 
	self assert: decl dimensions second upperBound class equals: FASTFortranAsterisk.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDimensionStatementExpression [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION M(HI, HI*3 + LO)
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDimensionStatementExpression.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "name": "M"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "variable_expression",
                                        "variable": {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "19"
                                            },
                                            "name": "HI"
                                        }
                                    }
                                },
                                {
                                    "tag": "binary_expression",
                                    "lhs": {
                                        "tag": "binary_expression",
                                        "lhs": {
                                            "tag": "variable_expression",
                                            "variable": {
                                                "tag": "symbolic_name",
                                                "start_pos": {
                                                    "line": "2",
                                                    "column": "23"
                                                },
                                                "name": "HI"
                                            }
                                        },
                                        "operator": "*",
                                        "expression": {
                                            "tag": "literal_expression",
                                            "literal": {
                                                "tag": "unsigned_int_constant",
                                                "start_pos": {
                                                    "line": "2",
                                                    "column": "26"
                                                },
                                                "value": "3"
                                            }
                                        }
                                    },
                                    "operator": "+",
                                    "expression": {
                                        "tag": "variable_expression",
                                        "variable": {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "30"
                                            },
                                            "name": "LO"
                                        }
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 57.

	self assert: stmt declarators size equals: 1.
	decl := stmt declarators anyOne.

	self assert: decl variable equals: 'm'.
	self assert: decl dimensions size equals: 2.
	self assert: decl dimensions first lowerBound equals: nil. 
	self assert: decl dimensions first upperBound class equals: FASTFortranScalarVariable.
	self assert: decl dimensions second lowerBound equals: nil. 
	self assert: decl dimensions second upperBound class equals: FASTFortranBinaryExpression.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDimensionStatementMultipleDim [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION V(4,4) 
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDimensionStatementMultipleDim.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "name": "V"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "19"
                                            },
                                            "value": "4"
                                        }
                                    }
                                },
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "21"
                                        },
                                        "value": "4"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 47.

	self assert: stmt declarators size equals: 1.
	decl := stmt declarators anyOne.

	self assert: decl variable equals: 'v'.
	self assert: decl dimensions size equals: 2.
	self assert: decl dimensions first lowerBound equals: nil. 
	self assert: decl dimensions first upperBound class equals: FASTFortranIntegerLiteral.
	self assert: decl dimensions second lowerBound equals: nil. 
	self assert: decl dimensions second upperBound class equals: FASTFortranIntegerLiteral.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDimensionStatementMultipleVariables [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION M(4,4), V(100)
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDimensionStatementMultipleVariables.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "name": "M"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "19"
                                            },
                                            "value": "4"
                                        }
                                    }
                                },
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "21"
                                        },
                                        "value": "4"
                                    }
                                }
                            ]
                        },
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "25"
                                },
                                "name": "V"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "27"
                                        },
                                        "value": "100"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 55.

	self assert: stmt declarators size equals: 2.

	decl := stmt declarators first.
	self assert: decl variable equals: 'm'.
	self assert: decl dimensions size equals: 2.

	decl := stmt declarators second.
	self assert: decl variable equals: 'v'.
	self assert: decl dimensions size equals: 1.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDimensionStatementRange [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION M(-3:3, 4, 3:9)
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDimensionStatementRange.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "name": "M"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "unary_expression",
                                        "operator": "-",
                                        "expression": {
                                            "tag": "literal_expression",
                                            "literal": {
                                                "tag": "unsigned_int_constant",
                                                "start_pos": {
                                                    "line": "2",
                                                    "column": "20"
                                                },
                                                "value": "3"
                                            }
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "22"
                                            },
                                            "value": "3"
                                        }
                                    }
                                },
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "25"
                                            },
                                            "value": "4"
                                        }
                                    }
                                },
                                {
                                    "lower_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "28"
                                            },
                                            "value": "3"
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "30"
                                            },
                                            "value": "9"
                                        }
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 56.

	self assert: stmt declarators size equals: 1.
	decl := stmt declarators anyOne.

	self assert: decl variable equals: 'm'.
	self assert: decl dimensions size equals: 3.

	self assert: decl dimensions first lowerBound class equals: FASTFortranIntegerLiteral. 
	self assert: decl dimensions first upperBound class equals: FASTFortranIntegerLiteral.

	self assert: decl dimensions second lowerBound equals: nil. 
	self assert: decl dimensions second upperBound class equals: FASTFortranIntegerLiteral.
	
	self assert: decl dimensions third lowerBound class equals: FASTFortranIntegerLiteral.
	self assert: decl dimensions third upperBound class equals: FASTFortranIntegerLiteral.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDimensionStatementSimple [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION V(1000) 
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDimensionStatementSimple.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "name": "V"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "19"
                                        },
                                        "value": "1000"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 48.

	self assert: stmt declarators size equals: 1.
	decl := stmt declarators anyOne.

	self assert: decl variable equals: 'v'.
	self assert: decl dimensions size equals: 1.
	self assert: decl dimensions anyOne lowerBound equals: nil. 
	self assert: decl dimensions anyOne upperBound class equals: FASTFortranIntegerLiteral.
	self assert: decl dimensions anyOne upperBound primitiveValue equals: '1000'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDimensionStatementVarDims [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION M(N,N)
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDimensionStatementVarDims.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "SIMPLEMAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "name": "M"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "variable_expression",
                                        "variable": {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "19"
                                            },
                                            "name": "N"
                                        }
                                    }
                                },
                                {
                                    "tag": "variable_expression",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "21"
                                        },
                                        "name": "N"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 47.

	self assert: stmt declarators size equals: 1.
	decl := stmt declarators anyOne.

	self assert: decl variable equals: 'm'.
	self assert: decl dimensions size equals: 2.
	self assert: decl dimensions first upperBound class equals: FASTFortranScalarVariable.
	self assert: decl dimensions first upperBound name equals: 'n'.
	self assert: decl dimensions second upperBound class equals: FASTFortranScalarVariable.
	self assert: decl dimensions second upperBound name equals: 'n'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDoStatementEmptyInitIncrementLimit [

	| result stmt control |
	fortranCode := '      program main
      do i = len(chaine),1,-1
      end do
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDoStatementEmptyInitIncrementLimit.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "7"
                            },
                            "name": "DOI"
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "substring",
                                "array": {
                                    "tag": "array_element_name",
                                    "name": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "14"
                                        },
                                        "name": "LEN"
                                    },
                                    "qualifiers_list": [
                                        {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "18"
                                            },
                                            "name": "CHAINE"
                                        }
                                    ]
                                },
                                "lower_bound": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "26"
                                    },
                                    "value": "1"
                                },
                                "upper_bound": {
                                    "tag": "constant_signed",
                                    "sign": "-",
                                    "constant": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "29"
                                        },
                                        "value": "1"
                                    }
                                }
                            }
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "3",
                                "column": "7"
                            },
                            "name": "ENDDO"
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "3",
                                    "column": "13"
                                },
                                "value": ""
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.
	self assert: stmt statementBlock statements isEmpty.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 61.

	control := stmt loopControl.
	self assert: control class equals: FASTFortranLoopControlExpression.
	self assert: control startPos equals: 29.

	self assert: control init class equals: FASTFortranAssignmentExpression.
	self assert: control init startPos equals: 29.

	self assert: control increment class equals: FASTFortranIntegerLiteral.
	self assert: control increment startPos equals: 47.
	self assert: control increment primitiveValue equals: '-1'.

	self assert: control limit class equals: FASTFortranIntegerLiteral.
	self assert: control limit startPos equals: 45.
	self assert: control limit primitiveValue equals: '1'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDoStatementEmptyNoIncrement [

	| result stmt control |
	fortranCode := '      program main
      do i=1, max
      end do
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDoStatementEmptyNoIncrement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "7"
                            },
                            "name": "DOI"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "binary_expression",
                                "lhs": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "12"
                                    },
                                    "value": "1"
                                },
                                "operator": "*",
                                "expression": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "15"
                                    },
                                    "name": "MAX"
                                }
                            }
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "3",
                                "column": "7"
                            },
                            "name": "ENDDO"
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "3",
                                    "column": "13"
                                },
                                "value": ""
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.
	self assert: stmt statementBlock statements isEmpty.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 49.

	control := stmt loopControl.
	self assert: control class equals: FASTFortranLoopControlExpression.
	self assert: control limit class equals: FASTFortranScalarVariable.
	self assert: control limit name equals: 'max'.
	self assert: control increment isNil.
	self assert: control startPos equals: 29.

	self assert: control init class equals: FASTFortranAssignmentExpression.
	self assert: control init startPos equals: 29.

	self assert: control init variable class equals: FASTFortranScalarVariable.
	self assert: control init variable name equals: 'i'.
	self assert: control init variable startPos equals: 29.

	self assert: control init expression class equals: FASTFortranIntegerLiteral.
	self assert: control init expression primitiveValue equals: '1'.
	self assert: control init expression startPos equals: 31.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDoStatementNestedOneContinue [

	| result stmt |
	fortranCode := '      program main
      DO 30 L=1,10
      A=1
      DO 30 M=L,10
      a=2
   30 CONTINUE
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDoStatementNestedOneContinue.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "7",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "do_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "statement_number": "30",
                    "loop_control": {
                        "variable_name": {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "13"
                            },
                            "name": "L"
                        },
                        "init": {
                            "tag": "unsigned_int_constant",
                            "start_pos": {
                                "line": "2",
                                "column": "15"
                            },
                            "value": "1"
                        },
                        "increment": null
                    },
                    "statements_list": [
                        {
                            "tag": "assignment_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "7"
                            },
                            "left": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "7"
                                    },
                                    "name": "A"
                                }
                            ],
                            "right": [
                                {
                                    "tag": "arithmetic_expression",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "9"
                                        },
                                        "value": "1"
                                    }
                                }
                            ]
                        },
                        {
                            "tag": "do_statement",
                            "start_pos": {
                                "line": "4",
                                "column": "7"
                            },
                            "statement_number": "30",
                            "loop_control": {
                                "variable_name": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "4",
                                        "column": "13"
                                    },
                                    "name": "M"
                                },
                                "init": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "4",
                                        "column": "15"
                                    },
                                    "name": "L"
                                },
                                "increment": null
                            },
                            "statements_list": [
                                {
                                    "tag": "assignment_statement",
                                    "start_pos": {
                                        "line": "5",
                                        "column": "7"
                                    },
                                    "left": [
                                        {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "5",
                                                "column": "7"
                                            },
                                            "name": "A"
                                        }
                                    ],
                                    "right": [
                                        {
                                            "tag": "arithmetic_expression",
                                            "expression": {
                                                "tag": "unsigned_int_constant",
                                                "start_pos": {
                                                    "line": "5",
                                                    "column": "9"
                                                },
                                                "value": "2"
                                            }
                                        }
                                    ]
                                },
                                {
                                    "label": "30",
                                    "tag": "continue_statement",
                                    "start_pos": {
                                        "line": "6",
                                        "column": "7"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.

	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	"DO 30 L=1,10"
	stmt := result first statementBlock statements anyOne.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt statementBlock statements size equals: 3.
	self assert: stmt labelReferences size equals: 1.
	self assert: stmt labelReferences first class equals: FASTFortranLabelReference.
	self assert: stmt labelReferences first label equals: '30'.

	"A=1"
	stmt := result first statementBlock statements first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	"DO 30 M=L,10"
	stmt := result first statementBlock statements first statementBlock statements second.
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt statementBlock statements size equals: 1.
	self assert: stmt labelReferences size equals: 1.
	self assert: stmt labelReferences first class equals: FASTFortranLabelReference.
	self assert: stmt labelReferences first label equals: '30'.

	"a=2"
	stmt := stmt statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	"30 CONTINUE"
	stmt := result first statementBlock statements first statementBlock statements third.
	self assert: stmt class equals: FASTFortranContinueStatement.
	self assert: stmt label equals: '30'.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDoStatementWithComment [

	| result stmt |
	fortranCode := '      program main
      do i=1, max
C comment in loop
      end do
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {
        "3": "C comment in loop\n"
    },
    "file": "test/pharo/testDoStatementWithComment.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "5",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "7"
                            },
                            "name": "DOI"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "binary_expression",
                                "lhs": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "12"
                                    },
                                    "value": "1"
                                },
                                "operator": "*",
                                "expression": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "15"
                                    },
                                    "name": "MAX"
                                }
                            }
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "4",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "4",
                                "column": "7"
                            },
                            "name": "ENDDO"
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "4",
                                    "column": "13"
                                },
                                "value": ""
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.
	self assert: stmt statementBlock statements isEmpty.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 67.

	self assert: stmt statementBlock comments size equals: 1.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDoStatementWithLabelAndContinue [

	| result stmt |
	fortranCode := '      program main
      do 100 i=1, max
      a=1
100   continue
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDoStatementWithLabelAndContinue.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "5",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "do_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "statement_number": "100",
                    "loop_control": {
                        "variable_name": {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "14"
                            },
                            "name": "I"
                        },
                        "init": {
                            "tag": "unsigned_int_constant",
                            "start_pos": {
                                "line": "2",
                                "column": "16"
                            },
                            "value": "1"
                        },
                        "increment": null
                    },
                    "statements_list": [
                        {
                            "tag": "assignment_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "7"
                            },
                            "left": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "7"
                                    },
                                    "name": "A"
                                }
                            ],
                            "right": [
                                {
                                    "tag": "arithmetic_expression",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "9"
                                        },
                                        "value": "1"
                                    }
                                }
                            ]
                        },
                        {
                            "label": "100",
                            "tag": "continue_statement",
                            "start_pos": {
                                "line": "4",
                                "column": "7"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.

	self assert: stmt labelReferences size equals: 1.
	self assert: stmt labelReferences anyOne class equals: FASTFortranLabelReference.
	self assert: stmt labelReferences anyOne label equals: '100'.

	self assert: stmt statementBlock statements size equals: 2.

	self assert: stmt statementBlock statements first class equals: FASTFortranAssignmentStatement.
	self assert: stmt statementBlock statements first startPos equals: 48.
	
	self assert: stmt statementBlock statements second class equals: FASTFortranContinueStatement.
	self assert: stmt statementBlock statements second label equals: '100'.
	self assert: stmt statementBlock statements second startPos equals: 52.
	

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testDoStatementWithLabelAndTerminalStatement [

	| result stmt |
	fortranCode := '      program main
      do 100 i=1, max
100   print *,i
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testDoStatementWithLabelAndTerminalStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "do_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "statement_number": "100",
                    "loop_control": {
                        "variable_name": {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "14"
                            },
                            "name": "I"
                        },
                        "init": {
                            "tag": "unsigned_int_constant",
                            "start_pos": {
                                "line": "2",
                                "column": "16"
                            },
                            "value": "1"
                        },
                        "increment": null
                    },
                    "statements_list": [
                        {
                            "label": "100",
                            "tag": "print_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "7"
                            },
                            "io_list": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "15"
                                    },
                                    "name": "I"
                                }
                            ],
                            "format": [
                                {
                                    "name": "FMT",
                                    "parameter": {
                                        "asterisk": "*"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.

	self assert: stmt labelReferences size equals: 1.
	self assert: stmt labelReferences anyOne class equals: FASTFortranLabelReference.
	self assert: stmt labelReferences anyOne label equals: '100'.

	self assert: stmt statementBlock statements size equals: 1.
	self assert: stmt statementBlock statements anyOne class equals: FASTFortranPrintStatement.
	self assert: stmt statementBlock statements anyOne label equals: '100'.
	self assert: stmt statementBlock statements anyOne startPos equals: 48.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testEntryStatement [

	| result stmt |
	fortranCode := '      SUBROUTINE SUBRTN
      ENTRY XYZ(ABC,*)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testEntryStatement.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "SUBRTN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "name": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "13"
                        },
                        "name": "XYZ"
                    },
                    "parameters": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "17"
                            },
                            "name": "ABC"
                        },
                        "*"
                    ],
                    "tag": "entry_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranEntryStatement.
	self assert: stmt name primitiveValue equals: 'XYZ'.
	"self assert: stmt startPos equals: 31.
	self assert: stmt endPos equals: 46."

	self assert: stmt entryArguments size equals: 2.

	self assert: stmt entryArguments first class equals: FASTFortranScalarVariable.
	self assert: stmt entryArguments first name equals: 'ABC'.
	"self assert: stmt entryArguments first startPos equals: 41."

	self assert: stmt entryArguments second class equals: FASTFortranAsterisk.
	"self assert: stmt entryArguments second startPos equals: 45."

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testEquivalenceStatementOneGroupArrayVariables [

	| result stmt grp |
	fortranCode := '      SUBROUTINE SUBRTN
      EQUIVALENCE (a,b(1),c(2))
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testEquivalenceStatementOneGroupArrayVariables.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "SUBRTN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "equivalence_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        [
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "20"
                                },
                                "name": "A"
                            },
                            {
                                "tag": "array_element_name",
                                "name": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "22"
                                    },
                                    "name": "B"
                                },
                                "qualifiers_list": [
                                    {
                                        "tag": "arithmetic_expression",
                                        "expression": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "24"
                                            },
                                            "value": "1"
                                        }
                                    }
                                ]
                            },
                            {
                                "tag": "array_element_name",
                                "name": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "27"
                                    },
                                    "name": "C"
                                },
                                "qualifiers_list": [
                                    {
                                        "tag": "arithmetic_expression",
                                        "expression": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "29"
                                            },
                                            "value": "2"
                                        }
                                    }
                                ]
                            }
                        ]
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranEquivalenceStatement.
	self assert: stmt startPos equals: 31.
	self assert: stmt endPos equals: 55.

	self assert: stmt variableGroups size equals: 1.

	grp := stmt variableGroups first.
	self assert: grp class equals: FASTFortranEquivalenceGroup.
	self assert: grp startPos equals: 43.

	self assert: grp variables size equals: 3.
	self assert: grp variables first class equals: FASTFortranScalarVariable.
	self assert: grp variables second class equals: FASTFortranArrayVariable.
	self assert: grp variables third class equals: FASTFortranArrayVariable.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testEquivalenceStatementOneGroupScalarVariables [

	| result stmt grp |
	fortranCode := '      SUBROUTINE SUBRTN
      EQUIVALENCE (a,b,c)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testEquivalenceStatementOneGroupScalarVariables.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "SUBRTN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "equivalence_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        [
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "20"
                                },
                                "name": "A"
                            },
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "22"
                                },
                                "name": "B"
                            },
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "24"
                                },
                                "name": "C"
                            }
                        ]
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranEquivalenceStatement.
	self assert: stmt startPos equals: 31.
	self assert: stmt endPos equals: 49.

	self assert: stmt variableGroups size equals: 1.

	grp := stmt variableGroups first.
	self assert: grp class equals: FASTFortranEquivalenceGroup.
	self assert: grp startPos equals: 43.

	self assert: grp variables size equals: 3.
	grp variables do: [ :var |
		self assert: var class equals: FASTFortranScalarVariable.
		#(44 46 48) includes: var startPos.
		#('a' 'b' 'c') includes: var name
		
	]
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testEquivalenceStatementSeveralGroups [

	| result stmt grp |
	fortranCode := '      SUBROUTINE SUBRTN
      EQUIVALENCE (a,b,c), (d,e)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testEquivalenceStatementSeveralGroups.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "SUBRTN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "equivalence_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        [
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "20"
                                },
                                "name": "A"
                            },
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "22"
                                },
                                "name": "B"
                            },
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "24"
                                },
                                "name": "C"
                            }
                        ],
                        [
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "29"
                                },
                                "name": "D"
                            },
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "31"
                                },
                                "name": "E"
                            }
                        ]
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranEquivalenceStatement.
	self assert: stmt startPos equals: 31.
	self assert: stmt endPos equals: 56.

	self assert: stmt variableGroups size equals: 2.

	grp := stmt variableGroups first.
	self assert: grp class equals: FASTFortranEquivalenceGroup.
	self assert: grp variables size equals: 3.
	self assert: grp startPos equals: 43.

	grp := stmt variableGroups second.
	self assert: grp class equals: FASTFortranEquivalenceGroup.
	self assert: grp variables size equals: 2.
	self assert: grp startPos equals: 52.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testExit [
"NOT FORTRAN-77"

	| result stmt |
	fortranCode := '      PROGRAM TESTALT
       exit
      END 
'.
	jsonCode := ''.
	"result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranExitStatement.
	self assert: stmt startPos equals: 30.
	self assert: stmt endPos equals: 33."

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testExternalStatement [

	| result stmt |
	fortranCode := '      program main
      external mypnt
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testExternalStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "external_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "proc_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "16"
                            },
                            "name": "MYPNT"
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranExternalStatement.
	self assert: stmt name equals: 'mypnt'.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 39.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testFormatStatement [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
110   FORMAT( A8, 2X, I4, F8.2, F8.2 ) 
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testFormatStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "label": "110",
                    "tag": "format_statement",
                    "specification": [
                        {
                            "tag": "format_specification",
                            "repeat_factor": "",
                            "descriptor": {
                                "tag": "repeatable_edit_descriptor",
                                "repeated_descriptors": [
                                    "A8"
                                ]
                            },
                            "slash": ""
                        },
                        {
                            "tag": "format_specification",
                            "repeat_factor": "",
                            "descriptor": {
                                "tag": "nonrepeatable_edit_descriptor",
                                "descriptor": "2X"
                            },
                            "slash": ""
                        },
                        {
                            "tag": "format_specification",
                            "repeat_factor": "",
                            "descriptor": {
                                "tag": "repeatable_edit_descriptor",
                                "repeated_descriptors": [
                                    "I4"
                                ]
                            },
                            "slash": ""
                        },
                        {
                            "tag": "format_specification",
                            "repeat_factor": "",
                            "descriptor": {
                                "tag": "repeatable_edit_descriptor",
                                "repeated_descriptors": [
                                    "F8.2"
                                ]
                            },
                            "slash": ""
                        },
                        {
                            "tag": "format_specification",
                            "repeat_factor": "",
                            "descriptor": {
                                "tag": "repeatable_edit_descriptor",
                                "repeated_descriptors": [
                                    "F8.2"
                                ]
                            },
                            "slash": ""
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranFormatStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 59.

	self assert: stmt label equals: '110'.

	self assert: stmt formatDescription equals: '(a8,2x,i4,f8.2,f8.2)'

]

{ #category : #'tests-programUnit' }
SyntaxJsonToFASTTests >> testFunctionNoParameter [

	| fct |
	fortranCode := '      integer function aFct()
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testFunctionNoParameter.FOR",
    "program_units": [
        {
            "tag": "function",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "24"
                },
                "name": "AFCT"
            },
            "parameters": [],
            "return_type": {
                "tag": "type_reference",
                "name": "INTEGER"
            },
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": []
        }
    ]
}'.
	fct := self visitJsonCode.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct name primitiveValue equals: 'AFCT'.
	self assert: fct parameters isEmpty.
	self assert: fct statementBlock statements isEmpty.
	"self assert: fct startPos equals: 7."

	self assert: fct returnType class equals: FASTFortranIntegerType.
	"self assert: fct returnType startPos equals: 7."
	

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testFunctionStatement [

	| result stmt |
	fortranCode := '      program main
      add(x,y) = x + y
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testFunctionStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "left": [
                        {
                            "tag": "array_element_name",
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "7"
                                },
                                "name": "ADD"
                            },
                            "qualifiers_list": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "11"
                                    },
                                    "name": "X"
                                },
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "13"
                                    },
                                    "name": "Y"
                                }
                            ]
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "binary_expression",
                                "lhs": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "18"
                                    },
                                    "name": "X"
                                },
                                "operator": "+",
                                "rhs": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "22"
                                    },
                                    "name": "Y"
                                }
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranFunctionStatement.
	self assert: stmt name equals: 'add'.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 41.

	self assert: stmt arguments size equals: 2.
	stmt arguments do: [:arg |
		self assert: arg class equals: FASTFortranScalarVariable ].
	self assert: stmt expression class equals: FASTFortranBinaryExpression

]

{ #category : #'tests-programUnit' }
SyntaxJsonToFASTTests >> testFunctionWithParameter [

	| fct param |
	fortranCode := '
      integer function aFct(i,j)
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testFunctionWithParameter.FOR",
    "program_units": [
        {
            "tag": "function",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "2",
                    "column": "24"
                },
                "name": "AFCT"
            },
            "parameters": [
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "2",
                        "column": "29"
                    },
                    "name": "I"
                },
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "2",
                        "column": "31"
                    },
                    "name": "J"
                }
            ],
            "return_type": {
                "tag": "type_reference",
                "name": "INTEGER"
            },
            "start_pos": {
                "line": "2",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": []
        }
    ]
}'.

	fct := self visitJsonCode.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct parameters size equals: 2.

	self flag: 'should be a FASTFortranParameter, not a FASTFortranVariableExpression ?'.
	param := fct parameters first.
	self assert: param class equals: FASTFortranScalarVariable.
	self assert: param name equals: 'I'.
	"self assert: param startPos equals: 30."

	param := fct parameters second.
	self assert: param class equals: FASTFortranScalarVariable.
	self assert: param name equals: 'J'.
	"self assert: param startPos equals: 32."

]

{ #category : #'tests-programUnit' }
SyntaxJsonToFASTTests >> testFunctionWithStatement [

"syntax does not have return expression"

	| fct |
	fortranCode := '      integer function aFct()
      return 1
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testFunctionWithStatement.FOR",
    "program_units": [
        {
            "tag": "function",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "24"
                },
                "name": "AFCT"
            },
            "parameters": [],
            "return_type": {
                "tag": "type_reference",
                "name": "INTEGER"
            },
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "return_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    }
                }
            ]
        }
    ]
}'.
	fct := self visitJsonCode.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct name equals: 'afct'.
	self assert: fct parameters isEmpty.
	self assert: fct startPos equals: 7.

	self assert: fct statementBlock statements size equals: 1.
	self assert: fct statementBlock startPos equals: 37.
	self assert: fct statementBlock endPos equals: 44.

	self assert: fct returnType class equals: FASTFortranIntegerType.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testGoto [

"Syntax: need to rename goto type to something like goto_type"

	| result stmt |
	fortranCode := '      PROGRAM TESTALT
       GOTO 100
      END 
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testGoto.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "TESTALT"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "goto_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "type": "unconditional",
                    "labels": [
                        "100"
                    ],
                    "var": []
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranGoToStatement.
	self assert: stmt startPos equals: 30.
	self assert: stmt endPos equals: 37.


	self assert: stmt labelReferences size equals: 1.
	self assert: stmt labelReferences anyOne label equals: '100'.
	self assert: stmt labelReferences anyOne startPos equals: 35.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testGotoComputed [

	| result stmt |
	fortranCode := '      PROGRAM TESTALT
       GOTO (100,200,300,400) var
      END 
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testGotoComputed.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "TESTALT"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "goto_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "type": "computed",
                    "labels": [
                        "100",
                        "200",
                        "300",
                        "400"
                    ],
                    "var": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "31"
                            },
                            "name": "VAR"
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranGoToComputedStatement.
	self assert: stmt startPos equals: 30.
	self assert: stmt endPos equals: 55.


	self assert: stmt labelReferences size equals: 4.
	stmt labelReferences do: [ :label |
		self assert: label class equals: FASTFortranLabelReference.
		self assert: (label label endsWith: '00').
		self assert: (#(36 40 44 48) includes: label startPos)
	].

	self assert: stmt selectorExpression class equals: FASTFortranScalarVariable.
	self assert: stmt selectorExpression name equals: 'var'.
	self assert: stmt selectorExpression startPos equals: 53.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testIfArithmetic [

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
         IF ( A ) 10, 20, 30
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testIfArithmetic.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "arithmetic_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "10"
                    },
                    "expression": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "15"
                            },
                            "name": "A"
                        }
                    ],
                    "s1": "10",
                    "s2": "20",
                    "s3": "30"
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfArithmeticStatement.
	"self assert: conditional startPos equals: 31.
	self assert: conditional endPos equals: 49."

	self assert: conditional condition class equals: FASTFortranScalarVariable.
	self assert: conditional condition name equals: 'A'.
	"self assert: conditional condition startPos equals: 36."

	self assert: conditional lessLabel class equals: FASTFortranLabelReference.
	self assert: conditional lessLabel label equals: '10'.
	"self assert: conditional lessLabel startPos equals: 40."

	self assert: conditional equalLabel class equals: FASTFortranLabelReference.
	self assert: conditional equalLabel label equals: '20'.
	"self assert: conditional equalLabel startPos equals: 44."

	self assert: conditional greaterLabel class equals: FASTFortranLabelReference.
	self assert: conditional greaterLabel label equals: '30'.
	"self assert: conditional greaterLabel startPos equals: 48"
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testIfElseIf [
	"note: starting and ending position of else block are approximate"

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
         IF ( A ) THEN
          a = 1
         else if ( b ) then
          b = 1
         else if ( c ) then
          c = 1
         ELSE
          d = 1
         END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testIfElseIf.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "11",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "10"
                    },
                    "expression": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "15"
                        },
                        "name": "A"
                    },
                    "then_statements": [
                        {
                            "tag": "assignment_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "11"
                            },
                            "left": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "11"
                                    },
                                    "name": "A"
                                }
                            ],
                            "right": [
                                {
                                    "tag": "arithmetic_expression",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "15"
                                        },
                                        "value": "1"
                                    }
                                }
                            ]
                        }
                    ],
                    "else_block": {
                        "tag": "if_else_block",
                        "label": "",
                        "expression": {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "4",
                                "column": "20"
                            },
                            "name": "B"
                        },
                        "then_statements": [
                            {
                                "tag": "assignment_statement",
                                "start_pos": {
                                    "line": "5",
                                    "column": "11"
                                },
                                "left": [
                                    {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "5",
                                            "column": "11"
                                        },
                                        "name": "B"
                                    }
                                ],
                                "right": [
                                    {
                                        "tag": "arithmetic_expression",
                                        "expression": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "5",
                                                "column": "15"
                                            },
                                            "value": "1"
                                        }
                                    }
                                ]
                            }
                        ],
                        "else_block": {
                            "tag": "if_else_block",
                            "label": "",
                            "expression": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "6",
                                    "column": "20"
                                },
                                "name": "C"
                            },
                            "then_statements": [
                                {
                                    "tag": "assignment_statement",
                                    "start_pos": {
                                        "line": "7",
                                        "column": "11"
                                    },
                                    "left": [
                                        {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "7",
                                                "column": "11"
                                            },
                                            "name": "C"
                                        }
                                    ],
                                    "right": [
                                        {
                                            "tag": "arithmetic_expression",
                                            "expression": {
                                                "tag": "unsigned_int_constant",
                                                "start_pos": {
                                                    "line": "7",
                                                    "column": "15"
                                                },
                                                "value": "1"
                                            }
                                        }
                                    ]
                                }
                            ],
                            "else_block": {
                                "tag": "else_statement",
                                "else_label": "",
                                "else_statements": [
                                    {
                                        "tag": "assignment_statement",
                                        "start_pos": {
                                            "line": "9",
                                            "column": "11"
                                        },
                                        "left": [
                                            {
                                                "tag": "symbolic_name",
                                                "start_pos": {
                                                    "line": "9",
                                                    "column": "11"
                                                },
                                                "name": "D"
                                            }
                                        ],
                                        "right": [
                                            {
                                                "tag": "arithmetic_expression",
                                                "expression": {
                                                    "tag": "unsigned_int_constant",
                                                    "start_pos": {
                                                        "line": "9",
                                                        "column": "15"
                                                    },
                                                    "value": "1"
                                                }
                                            }
                                        ]
                                    }
                                ],
                                "end_if": {
                                    "label": ""
                                }
                            }
                        }
                    }
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1. .

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements size equals: 1.
	self assert: conditional thenStatementBlock startPos equals: 55.
	self assert: conditional elseStatementBlock startPos equals: 77.

	conditional := conditional elseStatementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements size equals: 1.
	self assert: conditional thenStatementBlock startPos equals: 99.
	self assert: conditional elseStatementBlock startPos equals: 121.

	conditional := conditional elseStatementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements size equals: 1.
	self assert: conditional thenStatementBlock startPos equals: 143.
	self assert: conditional elseStatementBlock startPos equals: 173.
	
	conditional := conditional elseStatementBlock statements first.
	self assert: conditional class equals: FASTFortranAssignmentStatement.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testIfElseWithComment [

	| result conditional |
	
	fortranCode := '      PROGRAM MYPROG
       IF ( A ) THEN 
       ELSE
C comment in else part
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {
        "4": "C comment in else part\n"
    },
    "file": "test/pharo/testIfElseWithComment.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "6",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "13"
                        },
                        "name": "A"
                    },
                    "then_statements": [],
                    "else_block": {
                        "tag": "else_statement",
                        "else_label": "",
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements isEmpty.
	self assert: conditional elseStatementBlock statements isEmpty.
	self assert: conditional elseStatementBlock comments size equals: 1.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testIfElseWithStatement [

	| result conditional |
	
	fortranCode := '      PROGRAM MYPROG
       IF ( A ) THEN 
       ELSE
        I = 1 
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testIfElseWithStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "6",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "13"
                        },
                        "name": "A"
                    },
                    "then_statements": [],
                    "else_block": {
                        "tag": "else_statement",
                        "else_label": "",
                        "else_statements": [
                            {
                                "tag": "assignment_statement",
                                "start_pos": {
                                    "line": "4",
                                    "column": "9"
                                },
                                "left": [
                                    {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "4",
                                            "column": "9"
                                        },
                                        "name": "I"
                                    }
                                ],
                                "right": [
                                    {
                                        "tag": "arithmetic_expression",
                                        "expression": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "4",
                                                "column": "13"
                                            },
                                            "value": "1"
                                        }
                                    }
                                ]
                            }
                        ],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 0.
	self assert: conditional elseStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements first class equals: FASTFortranAssignmentStatement.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testIfEmpty [

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
       IF ( A(1) ) THEN
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testIfEmpty.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "13"
                        },
                        "name": "A"
                    },
                    "then_statements": [],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.
	
	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional condition class equals: FASTFortranScalarVariable.
	self assert: conditional condition name equals: 'a'.
	self assert: conditional thenStatementBlock statements size equals: 0.
	self assert: conditional elseStatementBlock equals: nil.

"	self assert: conditional startPos equals: 29.
	self assert: conditional endPos equals: 55."

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testIfThenWithComment [

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
       IF ( A ) THEN
C comment in then part
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {
        "3": "C comment in then part\n"
    },
    "file": "test/pharo/testIfThenWithComment.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "5",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "13"
                        },
                        "name": "A"
                    },
                    "then_statements": [],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements isEmpty.
	self assert: conditional thenStatementBlock comments size equals: 1.
	self assert: conditional thenStatementBlock startPos equals: 43.
	self assert: conditional thenStatementBlock endPos equals: 64.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testIfThenWithStatement [

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
       IF ( A ) THEN
        I = 1
       END IF
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testIfThenWithStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "5",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "13"
                        },
                        "name": "A"
                    },
                    "then_statements": [
                        {
                            "tag": "assignment_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "9"
                            },
                            "left": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "9"
                                    },
                                    "name": "I"
                                }
                            ],
                            "right": [
                                {
                                    "tag": "arithmetic_expression",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "13"
                                        },
                                        "value": "1"
                                    }
                                }
                            ]
                        }
                    ],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock class equals: FASTFortranStatementBlock.
	self assert: conditional thenStatementBlock statements size equals: 1.
	"self assert: conditional thenStatementBlock startPos equals: 51.
	self assert: conditional thenStatementBlock endPos equals: 55."
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testIfThenWithTwoStatements [

	| result conditional thenStatements|
	fortranCode := '      PROGRAM MYPROG
      if (iur .eq. 0) then 
         write(*,*) '' user'',name,'' does not exist''
         return
      end if 
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testIfThenWithTwoStatements.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "6",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "block_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "expression": {
                        "tag": "logical_expression",
                        "expression": {
                            "tag": "logical_factor",
                            "negated": "false",
                            "expression": {
                                "tag": "logical_primary",
                                "expression": {
                                    "tag": "binary_expression",
                                    "lhs": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "11"
                                        },
                                        "name": "IUR"
                                    },
                                    "operator": ".EQ.",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "value": "0"
                                    }
                                }
                            }
                        }
                    },
                    "then_statements": [
                        {
                            "tag": "write_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "10"
                            },
                            "control_info_list": [
                                {
                                    "name": "UNIT",
                                    "parameter": {
                                        "asterisk": "*"
                                    }
                                },
                                {
                                    "name": "FMT",
                                    "parameter": {
                                        "asterisk": "*"
                                    }
                                }
                            ],
                            "io_list": [
                                {
                                    "tag": "character_expression",
                                    "expression": {
                                        "tag": "character_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "21"
                                        },
                                        "value": "user "
                                    }
                                },
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "29"
                                    },
                                    "name": "NAME"
                                },
                                {
                                    "tag": "character_expression",
                                    "expression": {
                                        "tag": "character_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "34"
                                        },
                                        "value": " does not exist"
                                    }
                                }
                            ]
                        },
                        {
                            "tag": "return_statement",
                            "start_pos": {
                                "line": "4",
                                "column": "10"
                            }
                        }
                    ],
                    "else_block": {
                        "else_statements": [],
                        "end_if": {
                            "label": ""
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	
	thenStatements := conditional thenStatementBlock statements.
	self assert: thenStatements size equals: 2.
	self assert: thenStatements first class equals: FASTFortranWriteStatement.
	self assert: thenStatements second class equals: FASTFortranReturnStatement

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testImplicitNoneStatement [

"Syntax: not supported now"

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
       implicit none
      END
'.
	jsonCode := ''.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranImplicitStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 41.

	self assert: stmt typingRules isEmpty

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testImplicitStatement [

	| result stmt rule |
	fortranCode := '      PROGRAM MYPROG
       IMPLICIT LOGICAL (A-Z)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testImplicitStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "implicit_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "type": {
                                "tag": "type_reference",
                                "name": "LOGICAL"
                            },
                            "elements": [
                                {
                                    "tag": "implicit_element",
                                    "left": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "26"
                                        },
                                        "name": "A"
                                    },
                                    "right": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "28"
                                        },
                                        "name": "Z"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.

	self assert: stmt class equals: FASTFortranImplicitStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 50.

	self assert: stmt typingRules size equals: 1.

	rule := stmt typingRules anyOne.
	self assert: rule type class equals: FASTFortranLogicalType.
	
	self assert: rule ranges size equals: 1.
	self assert: rule ranges anyOne class equals: FASTFortranImplicitRange.
	self assert: rule ranges anyOne from equals: 'a'.
	self assert: rule ranges anyOne to   equals: 'z'.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testImplicitStatementCharacterSize [

	| result stmt rule |
	fortranCode := '      PROGRAM MYPROG
       IMPLICIT CHARACTER*4 (C,S) 
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testImplicitStatementCharacterSize.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "implicit_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "type": {
                                "tag": "type_reference",
                                "name": "CHARACTER",
                                "len_specification": {
                                    "tag": "nonzero_unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "27"
                                    },
                                    "value": "4"
                                }
                            },
                            "elements": [
                                {
                                    "tag": "implicit_element",
                                    "left": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "30"
                                        },
                                        "name": "C"
                                    },
                                    "right": {}
                                },
                                {
                                    "tag": "implicit_element",
                                    "left": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "32"
                                        },
                                        "name": "S"
                                    },
                                    "right": {}
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.

	self assert: stmt class equals: FASTFortranImplicitStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 54.

	self assert: stmt typingRules size equals: 1.

	rule := stmt typingRules anyOne.
	self assert: rule type class equals: FASTFortranCharacterType.
	self assert: rule type size class equals: FASTFortranIntegerLiteral.
	self assert: rule type size primitiveValue equals: '4'.


]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testImplicitStatementNoRange [

	| result stmt rule |
	fortranCode := '      PROGRAM MYPROG
       IMPLICIT COMPLEX (U,V,W)
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testImplicitStatementNoRange.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "implicit_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "type": {
                                "tag": "type_reference",
                                "name": "COMPLEX"
                            },
                            "elements": [
                                {
                                    "tag": "implicit_element",
                                    "left": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "26"
                                        },
                                        "name": "U"
                                    },
                                    "right": {}
                                },
                                {
                                    "tag": "implicit_element",
                                    "left": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "28"
                                        },
                                        "name": "V"
                                    },
                                    "right": {}
                                },
                                {
                                    "tag": "implicit_element",
                                    "left": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "30"
                                        },
                                        "name": "W"
                                    },
                                    "right": {}
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.

	self assert: stmt class equals: FASTFortranImplicitStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 52.

	self assert: stmt typingRules size equals: 1.

	rule := stmt typingRules anyOne.
	self assert: rule type class equals: FASTFortranComplexType.
	
	self assert: rule ranges size equals: 3.
	rule ranges do: [ :range |
		self assert: range to equals: nil.
	]

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testImplicitStatementSeveralItems [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
       IMPLICIT LOGICAL (l-N), INTEGER (C,S) 
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testImplicitStatementSeveralItems.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "implicit_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "type": {
                                "tag": "type_reference",
                                "name": "LOGICAL"
                            },
                            "elements": [
                                {
                                    "tag": "implicit_element",
                                    "left": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "26"
                                        },
                                        "name": "L"
                                    },
                                    "right": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "28"
                                        },
                                        "name": "N"
                                    }
                                }
                            ]
                        },
                        {
                            "type": {
                                "tag": "type_reference",
                                "name": "INTEGER"
                            },
                            "elements": [
                                {
                                    "tag": "implicit_element",
                                    "left": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "41"
                                        },
                                        "name": "C"
                                    },
                                    "right": {}
                                },
                                {
                                    "tag": "implicit_element",
                                    "left": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "43"
                                        },
                                        "name": "S"
                                    },
                                    "right": {}
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.

	self assert: stmt class equals: FASTFortranImplicitStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 65.

	self assert: stmt typingRules size equals: 2.

	self assert: stmt typingRules first class equals: FASTFortranImplicitTypingRule.
	self assert: stmt typingRules first type class equals: FASTFortranLogicalType.
	self assert: stmt typingRules second class equals: FASTFortranImplicitTypingRule.
	self assert: stmt typingRules second type class equals: FASTFortranIntegerType.

]

{ #category : #'tests-expression' }
SyntaxJsonToFASTTests >> testImpliedDoExpression [

	| result stmt control |
	fortranCode := '      PROGRAM MYPROG
      WRITE (*,*) (SPACE,I,I=1,N)

      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testImpliedDoExpression.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "write_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "control_info_list": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "asterisk": "*"
                            }
                        },
                        {
                            "name": "FMT",
                            "parameter": {
                                "asterisk": "*"
                            }
                        }
                    ],
                    "io_list": [
                        {
                            "tag": "data_imply_do_list",
                            "dlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "20"
                                    },
                                    "name": "SPACE"
                                },
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "26"
                                    },
                                    "name": "I"
                                },
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "28"
                                    },
                                    "name": "I"
                                }
                            ],
                            "m1": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "30"
                                },
                                "value": "1"
                            },
                            "m2": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "32"
                                },
                                "name": "N"
                            },
                            "m3": {}
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 54.

	self assert: stmt arguments size equals: 1.

	self assert: stmt arguments anyOne class equals: FASTFortranImpliedDoExpression.
	self assert: stmt arguments first startPos equals: 40.

	self assert: stmt arguments anyOne variables size equals: 2.	

	control := stmt arguments first loopControl.
	self assert: control class equals: FASTFortranLoopControlExpression.
	self assert: control limit class equals: FASTFortranScalarVariable.
	self assert: control limit name equals: 'n'.
	self assert: control increment isNil.

	self assert: control init class equals: FASTFortranAssignmentExpression.

	self assert: control init variable class equals: FASTFortranScalarVariable.
	self assert: control init variable name equals: 'i'.

	self assert: control init expression class equals: FASTFortranIntegerLiteral.
	self assert: control init expression primitiveValue equals: '1'.


]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testInquireStatement [

	| stmt result |
	fortranCode := '      program main
      inquire(unit=xunit,form=zform,err=10,iostat=zios)
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testInquireStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "inquire_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "20"
                                },
                                "name": "XUNIT"
                            }
                        },
                        {
                            "name": "FORM",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "31"
                                },
                                "name": "ZFORM"
                            }
                        },
                        {
                            "name": "ERR",
                            "parameter": {
                                "label_ref": "10"
                            }
                        },
                        {
                            "name": "IOSTAT",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "51"
                                },
                                "name": "ZIOS"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.

	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranInquireStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 74.

	self assert: stmt ioParameters size equals: 4.

	self assert: stmt ioParameters first class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters first startPos equals: 34.
	self assert: stmt ioParameters first variable name equals: 'unit'.
	self assert: stmt ioParameters second class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters second startPos equals: 45.
	self assert: stmt ioParameters second variable name equals: 'form'.
	self assert: stmt ioParameters third class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters third startPos equals: 56.
	self assert: stmt ioParameters third variable name equals: 'err'.
	self assert: stmt ioParameters fourth class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters fourth startPos equals: 63.
	self assert: stmt ioParameters fourth variable name equals: 'iostat'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testInquireStatementFilename [
"Syntax: no json was generated"
	| stmt result |
	fortranCode := '      program main
      NQUIRE( FILE=''.profile'', EXIST=THERE ) end
'.
	jsonCode := ''.

	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranInquireStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 64.

	self assert: stmt ioParameters size equals: 2.

	self assert: stmt ioParameters first class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters first startPos equals: 35.
	self assert: stmt ioParameters first variable name equals: 'file'.
	self assert: stmt ioParameters first expression class equals: FASTFortranCharacterLiteral.
	self assert: stmt ioParameters first expression primitiveValue equals: '.profile'.

	self assert: stmt ioParameters second class equals: FASTFortranAssignmentExpression.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testInquireStatementImplicitUnit [

	| stmt result |
	fortranCode := '      program main
      INQUIRE ( 3, OPENED=OK, NAMED=HASNAME, NAME=FN ) 
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testInquireStatementImplicitUnit.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "inquire_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "value": "3"
                            }
                        },
                        {
                            "name": "OPENED",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "27"
                                },
                                "name": "OK"
                            }
                        },
                        {
                            "name": "NAMED",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "37"
                                },
                                "name": "HASNAME"
                            }
                        },
                        {
                            "name": "NAME",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "51"
                                },
                                "name": "FN"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.

	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranInquireStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 73.

	self assert: stmt ioParameters size equals: 4.

	self assert: stmt ioParameters first class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters first startPos equals: 36.
	self assert: stmt ioParameters first primitiveValue equals: '3'.

	self assert: stmt ioParameters second class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters third class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters fourth class equals: FASTFortranAssignmentExpression.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testIntrinsicStatement [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
       intrinsic SIN, COS
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testIntrinsicStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "intrinsic_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "fun_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "18"
                            },
                            "name": "SIN"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "23"
                            },
                            "name": "COS"
                        }
                    ]
                }
            ]
        }
    ]
}'.

	result := self visitJsonCode.

	stmt := result first statementBlock statements first.

	self assert: stmt class equals: FASTFortranIntrinsicStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 46.

	self assert: stmt variables size equals: 2.

	self assert: stmt variables first class equals: FASTFortranScalarVariable.
	self assert: stmt variables first startPos equals: 39.
	self assert: stmt variables first name equals: 'sin'.
	self assert: stmt variables second class equals: FASTFortranScalarVariable.
	self assert: stmt variables second startPos equals: 44.
	self assert: stmt variables second name equals: 'cos'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testLogicalIfEmpty [

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
       IF ( A .eq. 5 ) RETURN
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testLogicalIfEmpty.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "logical_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": {
                        "tag": "logical_expression",
                        "expression": {
                            "tag": "logical_factor",
                            "negated": "false",
                            "expression": {
                                "tag": "logical_primary",
                                "expression": {
                                    "tag": "binary_expression",
                                    "lhs": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "13"
                                        },
                                        "name": "A"
                                    },
                                    "operator": ".EQ.",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "value": "5"
                                    }
                                }
                            }
                        }
                    },
                    "statement": {
                        "tag": "return_statement",
                        "start_pos": {
                            "line": "2",
                            "column": "24"
                        }
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.
	
	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfLogicalStatement.

	self assert: conditional condition class equals: FASTFortranBinaryExpression.
	self assert: conditional condition startPos equals: 34.

	self assert: conditional statement class equals: FASTFortranReturnStatement.
	self assert: conditional statement startPos equals: 45.

	self assert: conditional startPos equals: 29.
	self assert: conditional endPos equals: 50.

]

{ #category : #'tests-programUnit' }
SyntaxJsonToFASTTests >> testMainProgramAndSubroutine [

	| result progUnit |
	fortranCode := '      PROGRAM TESTALT
      END 
      
      SUBROUTINE RANK
      END
'.

	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testMainProgramAndSubroutine.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "TESTALT"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": []
        },
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "4",
                    "column": "18"
                },
                "name": "RANK"
            },
            "parameters": [],
            "start_pos": {
                "line": "4",
                "column": "7"
            },
            "end_pos": {
                "line": "5",
                "column": "9"
            },
            "statement_list": []
        }
    ]
}
'.
	result := self visitJsonCode.

	self assert: result isCollection.
	self assert: result size equals: 2.

	progUnit := result first.
	self assert: progUnit class equals: FASTFortranProgramMain.
	self assert: progUnit name equals: 'TESTALT'.

	progUnit := result second.
	self assert: progUnit class equals: FASTFortranSubroutine.
	self assert: progUnit name equals: 'RANK'.
]

{ #category : #'tests-programUnit' }
SyntaxJsonToFASTTests >> testMainProgramEmptyBody [
	| main body |

	fortranCode := '      program main
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/program-main.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": []
        }
    ]
}
'.
	main := self visitJsonCode.

	self assert: main class equals: FASTFortranProgramMain.

	body := main statementBlock.
	self assert: body statements isCollection.
	self assert: body statements size equals: 0.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testOpenStatement [

	| stmt result |
	fortranCode := '      PROGRAM main
      OPEN(8, FILE=''projectA/data.test'', ERR=99)
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testOpenStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "open_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "12"
                                },
                                "value": "8"
                            }
                        },
                        {
                            "name": "FILE",
                            "parameter": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "20"
                                },
                                "value": "''projectA/data.test''"
                            }
                        },
                        {
                            "name": "ERR",
                            "parameter": {
                                "label_ref": "99"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.

	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranOpenStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 67.

	self assert: stmt ioParameters size equals: 3.

	self assert: stmt ioParameters first class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters first startPos equals: 31.
	self assert: stmt ioParameters first primitiveValue equals: '8'.

	self assert: stmt ioParameters second class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters second startPos equals: 34.
	self assert: stmt ioParameters second variable name equals: 'file'.
	self assert: stmt ioParameters second expression class equals: FASTFortranCharacterLiteral.
	self assert: stmt ioParameters second expression primitiveValue equals: 'projectA/data.test'.

	self assert: stmt ioParameters third class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters third startPos equals: 61.
	self assert: stmt ioParameters third variable name equals: 'err'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testParameterStatement [

	| result stmt var |
	fortranCode := '      program main
      PARAMETER (PI=3.141593, TEXT=''Header'', T=.TRUE.)
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testParameterStatement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "parameter_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "18"
                                },
                                "name": "PI"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "unsigned_real_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "21"
                                    },
                                    "value": "3.141593"
                                }
                            }
                        },
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "31"
                                },
                                "name": "TEXT"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "character_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "36"
                                    },
                                    "value": "''Header''"
                                }
                            }
                        },
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "46"
                                },
                                "name": "T"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "logical_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "48"
                                    },
                                    "value": ".TRUE."
                                }
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranParameterStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 73.
	
	self assert: stmt declarators size equals: 3.

	var := stmt declarators first.
	self assert: var class equals: FASTFortranVariableDeclarator.
	self assert: var variable equals: 'pi'.
	self assert: var expression class equals: FASTFortranRealLiteral.
	self assert: var expression primitiveValue equals: '3.141593'.
	self assert: var startPos equals: 37.

	var := stmt declarators second.
	self assert: var class equals: FASTFortranVariableDeclarator.
	self assert: var variable equals: 'text'.
	self assert: var expression class equals: FASTFortranCharacterLiteral.
	self assert: var expression primitiveValue equals: 'Header'.
	self assert: var startPos equals: 50.

	var := stmt declarators third.
	self assert: var class equals: FASTFortranVariableDeclarator.
	self assert: var variable equals: 't'.
	self assert: var expression class equals: FASTFortranBooleanLiteral.
	self assert: var expression primitiveValue equals: '.true.'.
	self assert: var startPos equals: 65.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testPauseStatementEmpty [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      pause
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testPauseStatementEmpty.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "pause_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranPauseStatement.
	"self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 32."

	self assert: stmt displayArgument equals: nil


]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testPauseStatementWithInteger [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      pause 1
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testPauseStatementWithInteger.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "pause_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "argument": {
                        "tag": "unsigned_int_constant",
                        "start_pos": {
                            "line": "2",
                            "column": "13"
                        },
                        "value": "1"
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranPauseStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 34.

	self assert: stmt displayArgument equals: '1'


]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testPauseStatementWithString [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      stop ''error''
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testPauseStatementWithString.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "stop_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "argument": {
                        "tag": "character_constant",
                        "start_pos": {
                            "line": "2",
                            "column": "12"
                        },
                        "value": "''error''"
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 39.

	self assert: stmt displayArgument equals: '''error'''


]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testPrintMultipleVariables [

	| stmt result  var arguments |
	fortranCode := '      subroutine mysub (msg)
      PRINT *, X, Y, Z
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testPrintMultipleVariables.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "MYSUB"
            },
            "parameters": [
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "25"
                    },
                    "name": "MSG"
                }
            ],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "print_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "io_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "16"
                            },
                            "name": "X"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "19"
                            },
                            "name": "Y"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "22"
                            },
                            "name": "Z"
                        }
                    ],
                    "format": [
                        {
                            "name": "FMT",
                            "parameter": {
                                "asterisk": "*"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranPrintStatement.
	self assert: stmt format class equals: FASTFortranAsterisk.
	self assert: stmt startPos equals: 36.
	self assert: stmt endPos equals: 51.

	
	arguments := stmt arguments.
	self assert: arguments size equals: 3.

	var := arguments first.
	self assert: var class equals: FASTFortranScalarVariable.
	self assert: var name equals: 'x'.

	var := arguments second.
	self assert: var class equals: FASTFortranScalarVariable.
	self assert: var name equals: 'y'.

	var := arguments third.
	self assert: var class equals: FASTFortranScalarVariable.
	self assert: var name equals: 'z'
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testPrintOneVariable [

	| stmt result arguments |
	fortranCode := '      subroutine mysub (msg)
      PRINT *, X
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testPrintOneVariable.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "MYSUB"
            },
            "parameters": [
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "25"
                    },
                    "name": "MSG"
                }
            ],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "print_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "io_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "16"
                            },
                            "name": "X"
                        }
                    ],
                    "format": [
                        {
                            "name": "FMT",
                            "parameter": {
                                "asterisk": "*"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranPrintStatement.
	self assert: stmt startPos equals: 36.
	self assert: stmt endPos equals: 45.

	self assert: stmt format class equals: FASTFortranAsterisk.

	arguments := stmt arguments.
	self assert: arguments size equals: 1.
	self assert: arguments first class equals: FASTFortranScalarVariable.
	self assert: arguments first name equals: 'x'
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testReadWithFormat [

	| stmt result |
	fortranCode := '      subroutine mysub ()
      READ( 3, ''(5F4.1)'') V
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testReadWithFormat.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "MYSUB"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "read_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "control_info_list": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "13"
                                },
                                "value": "3"
                            }
                        },
                        {
                            "name": "FMT",
                            "parameter": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "16"
                                },
                                "value": "(5F4.1)"
                            }
                        }
                    ],
                    "io_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "27"
                            },
                            "name": "V"
                        }
                    ],
                    "format": []
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranReadStatement.
	self assert: stmt startPos equals: 33.
	self assert: stmt endPos equals: 53.

	self assert: stmt ioParameters size equals: 2.

	self assert: stmt ioParameters first class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters first startPos equals: 39.
	self assert: stmt ioParameters second class equals: FASTFortranCharacterLiteral.
	self assert: stmt ioParameters second startPos equals: 42.

	self assert: stmt arguments size equals: 1.

	self assert: stmt arguments first class equals: FASTFortranScalarVariable.
	self assert: stmt arguments first startPos equals: 53.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testReturnStatementEmpty [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      return
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testReturnStatementEmpty.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "return_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranReturnStatement.
	"self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 33."


]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testRewindStatementIOParameters [

	| stmt result |
	fortranCode := '      PROGRAM main
      REWIND (UNIT=3, IOSTAT=CODE, ERR=100) 
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testRewindStatementIOParameters.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "rewind_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "20"
                                },
                                "value": "3"
                            }
                        },
                        {
                            "name": "IOSTAT",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "30"
                                },
                                "name": "CODE"
                            }
                        },
                        {
                            "name": "ERR",
                            "parameter": {
                                "label_ref": "100"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.

	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranRewindStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 62.

	self assert: stmt ioParameters size equals: 3.

	self assert: stmt ioParameters first class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters first startPos equals: 34.
	self assert: stmt ioParameters first variable name equals: 'unit'.
	self assert: stmt ioParameters first expression primitiveValue equals: '3'.

	self assert: stmt ioParameters second class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters second startPos equals: 42.
	self assert: stmt ioParameters second variable name equals: 'iostat'.

	self assert: stmt ioParameters third class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters third startPos equals: 55.
	self assert: stmt ioParameters third variable name equals: 'err'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testRewindStatementUnit [

	| stmt result |
	fortranCode := '      PROGRAM main
      REWIND 3
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testRewindStatementUnit.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "rewind_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "14"
                                },
                                "value": "3"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranRewindStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 33.

	self assert: stmt ioParameters size equals: 1.

	self assert: stmt ioParameters first class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters first startPos equals: 33.
	self assert: stmt ioParameters first primitiveValue equals: '3'
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testStatementWithLabel [

	| result stmt |
	fortranCode := '      PROGRAM TESTALT
10     STOP
      END 
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testStatementWithLabel.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "TESTALT"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "label": "10",
                    "tag": "stop_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt label equals: '10'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testStopStatementEmpty [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      stop
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testStopStatementEmpty.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "stop_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranStopStatement.
	"self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 31."

	self assert: stmt displayArgument equals: nil


]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testStopStatementWithInteger [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      stop 1
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testStopStatementWithInteger.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "stop_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "argument": {
                        "tag": "unsigned_int_constant",
                        "start_pos": {
                            "line": "2",
                            "column": "12"
                        },
                        "value": "1"
                    }
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranStopStatement.
	"self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 33."

	self assert: stmt displayArgument equals: '1'


]

{ #category : #'tests-programUnit' }
SyntaxJsonToFASTTests >> testSubroutineEmpty [

	| rtn |
	fortranCode := '      SUBROUTINE RANK
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/subroutine.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "RANK"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": []
        }
    ]
}'.
	rtn := self visitJsonCode.
	self assert: rtn class equals: FASTFortranSubroutine.
	self assert: rtn parameters isEmpty.
	self assert: rtn statementBlock statements isEmpty.
	self assert: rtn startPos equals: 7.
	self assert: rtn endPos equals: 30
]

{ #category : #'tests-programUnit' }
SyntaxJsonToFASTTests >> testSubroutineWithParameters [

	| rtn param |
	fortranCode := '      SUBROUTINE SIMPLESUBROUTINE( a, b)
      END
'.
	jsonCode := '{ "tag":"fortran_file", "comments": { }, "file" : "/home/anquetil/Pharo/images/fast-fortran-syntax/FastTmp/tmpFASTSource.f", "program_units" : [{"tag" : "subroutine", "name" : {"tag" : "symbolic_name", "start_pos" : {"line" : "1", "column":"18"}, "name":"SIMPLESUBROUTINE"}, "parameters" : [{"tag" : "symbolic_name", "start_pos" : {"line" : "1", "column":"36"}, "name":"A"}, {"tag" : "symbolic_name", "start_pos" : {"line" : "1", "column":"39"}, "name":"B"}], "start_pos" : {"line" : "1", "column":"7"}, "end_pos" : {"line" : "2", "column":"9"}, "statement_list" : []}]}'.

	rtn := self visitJsonCode.
	self assert: rtn class equals: FASTFortranSubroutine.
	self assert: rtn name primitiveValue equals: 'SIMPLESUBROUTINE'.

	self assert: rtn startPos equals: 7.
	"self assert: rtn endPos equals: 50."
	
	self assert: rtn parameters size equals: 2.

	param := rtn parameters first.
	self assert: param name equals: 'A'.
	"self assert: param startPos equals: 36."

	param := rtn parameters second.
	self assert: param name equals: 'B'.
	"self assert: param startPos equals: 39."

]

{ #category : #'tests-programUnit' }
SyntaxJsonToFASTTests >> testSubroutineWithParametersOnTwoLines [

	| rtn |
	fortranCode := '      SUBROUTINE SIMPLESUBROUTINE( a,
     & b)
      continue
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/subroutine-with-parameters-two-lines.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "SIMPLESUBROUTINE"
            },
            "parameters": [
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "36"
                    },
                    "name": "A"
                },
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "name": "B"
                }
            ],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "4",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "continue_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "7"
                    }
                }
            ]
        }
    ]
}
'.
	rtn := self visitJsonCode.
	
	self assert: rtn class equals: FASTFortranSubroutine.
	self assert: rtn name equals: 'SIMPLESUBROUTINE'.

	self assert: rtn statementBlock class equals: FASTFortranStatementBlock.
	self assert: rtn statementBlock statements size equals: 1.
	"self assert: rtn statementBlock startPos equals: 55."

	self assert: rtn parameters size equals: 2.
	"self assert: rtn parameters first startPos equals: 36.
	self assert: rtn parameters second startPos equals: 46."

]

{ #category : #tests }
SyntaxJsonToFASTTests >> testTokenPosition [

	| result stmnts stmt |
	fortranCode := '      PROGRAM MYPROG
       STOP
100    CONTINUE
       EXIT
      END
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testTokenPosition.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "5",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "stop_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    }
                },
                {
                    "label": "100",
                    "tag": "continue_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    }
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "4",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "4",
                                "column": "8"
                            },
                            "name": "EXIT"
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "4",
                                    "column": "12"
                                },
                                "value": ""
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.
	
	stmnts := result statementBlock statements.
	stmt := stmnts first.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 32.

	stmt := stmnts second.
	self assert: stmt startPos equals: 41.
	self assert: stmt endPos equals: 48.

	stmt := stmnts third.
	self assert: stmt startPos equals: 57.
	self assert: stmt endPos equals: 60.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testVariableDeclarationCharacter [

	| result stmt var |
	fortranCode := '      program main
      character*40 aString
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testVariableDeclarationCharacter.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "CHARACTER",
                        "len_specification": {
                            "tag": "nonzero_unsigned_int_constant",
                            "start_pos": {
                                "line": "2",
                                "column": "17"
                            },
                            "value": "40"
                        }
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "20"
                                },
                                "name": "ASTRING"
                            },
                            "dimension_declarators": []
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 45.

	self assert: stmt type class equals: FASTFortranCharacterType.
	self assert: stmt type size class equals: FASTFortranIntegerLiteral.

	self assert: stmt declarators size equals: 1.
	var := stmt declarators first.
	self assert: var variable equals: 'astring'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testVariableDeclarationInteger [

	| result stmt var |
	fortranCode := '      program main
      integer i
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testVariableDeclarationInteger.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "INTEGER"
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "name": "I"
                            },
                            "dimension_declarators": []
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	"self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 34."

	self assert: stmt type class equals: FASTFortranIntegerType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var variable name equals: 'I'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testVariableDeclarationIntegerWithLength [

	| result stmt |
	fortranCode := '      program main
      integer*8 i
      end
'.
	jsonCode := ''.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.

	self assert: stmt type class equals: FASTFortranIntegerType.
	self assert: stmt type size class equals: FASTFortranIntegerLiteral.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testVariableDeclarationLogical [

	| result stmt var |
	fortranCode := '      program main
      logical b
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testVariableDeclarationLogical.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "LOGICAL"
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "15"
                                },
                                "name": "B"
                            },
                            "dimension_declarators": []
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.
	self
		assert: stmt class
		equals: FASTFortranVariableDeclarationStatement.
	"self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 34."

	self assert: stmt type class equals: FASTFortranLogicalType.
	self assert: stmt declarators size equals: 1.

	var := stmt declarators first.
	self assert: var variable name equals: 'B'
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testVariableDeclarationReal [

	| result stmt var |
	fortranCode := '      program main
      real c
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testVariableDeclarationReal.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "REAL"
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "12"
                                },
                                "name": "C"
                            },
                            "dimension_declarators": []
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	"self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 31."

	self assert: stmt type class equals: FASTFortranRealType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var variable name equals: 'C'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testVariableDeclarationWithLength [

	| result stmt var |
	fortranCode := '      program main
      character var*10, str*(n)
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testVariableDeclarationWithLength.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "CHARACTER"
                    },
                    "declarators": [
                        {
                            "len_specifier": {
                                "tag": "nonzero_unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "21"
                                },
                                "value": "10"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "name": "VAR"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "len_specifier": {
                                "tag": "variable_expression",
                                "variable": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "30"
                                    },
                                    "name": "N"
                                }
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "25"
                                },
                                "name": "STR"
                            },
                            "dimension_declarators": []
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 45.

	self assert: stmt type class equals: FASTFortranCharacterType.
	self assert: stmt type size class equals: FASTFortranIntegerLiteral.

	self assert: stmt declarators size equals: 1.
	var := stmt declarators first.
	self assert: var variable equals: 'astring'.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testVariableDeclarationWithStarSize [

	| result stmt |
	fortranCode := '      program main
      character*(*) str
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testVariableDeclarationWithStarSize.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "CHARACTER",
                        "len_specification": {
                            "asterisk": "*"
                        }
                    },
                    "declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "21"
                                },
                                "name": "STR"
                            },
                            "dimension_declarators": []
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 42.

	self assert: stmt type class equals: FASTFortranCharacterType.
	self assert: stmt type size class equals: FASTFortranAsterisk.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testWriteArrayIOParameter [

	| stmt result |
	fortranCode := '      program main
      WRITE(TEXTE(1:5),1) V
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testWriteArrayIOParameter.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "15"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "write_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "control_info_list": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "substring",
                                "variable": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "13"
                                    },
                                    "name": "TEXTE"
                                },
                                "lower_bound": {
                                    "tag": "arithmetic_expression",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "19"
                                        },
                                        "value": "1"
                                    }
                                },
                                "upper_bound": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "21"
                                    },
                                    "value": "5"
                                }
                            }
                        },
                        {
                            "name": "FMT",
                            "parameter": {
                                "label_ref": "1"
                            }
                        }
                    ],
                    "io_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "27"
                            },
                            "name": "V"
                        }
                    ]
                }
            ]
        }
    ]
}'.

	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 46.

	self assert: stmt ioParameters size equals: 2.

	self assert: stmt ioParameters first class equals: FASTFortranArrayVariable.
	self assert: stmt ioParameters first startPos equals: 32.
	self assert: stmt ioParameters first indices size equals: 1.
	self assert: stmt ioParameters second class equals: FASTFortranIntegerLiteral .
	self assert: stmt ioParameters second startPos equals: 43.

]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testWriteComplexFormat [

	| stmt result |
	fortranCode := '      subroutine mysub ()
      WRITE( 3, ''(5F4.1)'') V
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testWriteComplexFormat.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "MYSUB"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "write_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "control_info_list": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "14"
                                },
                                "value": "3"
                            }
                        },
                        {
                            "name": "FMT",
                            "parameter": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "value": "(5F4.1)"
                            }
                        }
                    ],
                    "io_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "28"
                            },
                            "name": "V"
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 33.
	self assert: stmt endPos equals: 54.

	self assert: stmt ioParameters size equals: 2.

	self assert: stmt ioParameters first class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters first startPos equals: 40.
	self assert: stmt ioParameters second class equals: FASTFortranCharacterLiteral .
	self assert: stmt ioParameters second startPos equals: 43.

	self assert: stmt arguments size equals: 1.

	self assert: stmt arguments first class equals: FASTFortranScalarVariable.
	self assert: stmt arguments first startPos equals: 54.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testWriteFullIOParameters [

	| stmt result |
	fortranCode := '      subroutine mysub ()
      WRITE( 1, 2, REC=3, IOSTAT=N, ERR=8 ) X, Y
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testWriteFullIOParameters.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "MYSUB"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "write_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "control_info_list": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "14"
                                },
                                "value": "1"
                            }
                        },
                        {
                            "name": "FMT",
                            "parameter": {
                                "label_ref": "2"
                            }
                        },
                        {
                            "name": "REC",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "24"
                                },
                                "value": "3"
                            }
                        },
                        {
                            "name": "END",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "34"
                                },
                                "name": "N"
                            }
                        },
                        {
                            "name": "ERR",
                            "parameter": "8"
                        }
                    ],
                    "io_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "45"
                            },
                            "name": "X"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "48"
                            },
                            "name": "Y"
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 33.
	self assert: stmt endPos equals: 74.

	self assert: stmt ioParameters size equals: 5.

	self assert: stmt ioParameters first class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters first startPos equals: 40.
	self assert: stmt ioParameters second class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters second startPos equals: 43.
	self assert: stmt ioParameters third class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters third startPos equals: 46.
	self assert: stmt ioParameters fourth class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters fourth startPos equals: 53.
	self assert: stmt ioParameters fifth class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters fifth startPos equals: 63.

	self assert: stmt arguments size equals: 2.

	self assert: stmt arguments first class equals: FASTFortranScalarVariable.
	self assert: stmt arguments first startPos equals: 71.
	self assert: stmt arguments second class equals: FASTFortranScalarVariable.
	self assert: stmt arguments second startPos equals: 74.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testWriteStarStarIOParameters [

	| stmt result |
	fortranCode := '      subroutine mysub ()
      WRITE( *, * ) ''I/O error'' 
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testWriteStarStarIOParameters.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "MYSUB"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "write_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "control_info_list": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "asterisk": "*"
                            }
                        },
                        {
                            "name": "FMT",
                            "parameter": {
                                "asterisk": "*"
                            }
                        }
                    ],
                    "io_list": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "21"
                                },
                                "value": "I/O error"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 33.
	self assert: stmt endPos equals: 57.

	self assert: stmt ioParameters size equals: 2.

	self assert: stmt ioParameters first class equals: FASTFortranAsterisk.
	self assert: stmt ioParameters first startPos equals: 40.
	self assert: stmt ioParameters second class equals: FASTFortranAsterisk.
	self assert: stmt ioParameters second startPos equals: 43.

	self assert: stmt arguments size equals: 1.

	self assert: stmt arguments first class equals: FASTFortranCharacterLiteral.
	self assert: stmt arguments first startPos equals: 47.
]

{ #category : #'tests-statement' }
SyntaxJsonToFASTTests >> testWriteToInternalFile [
	"Write Internal File seems to be just a String variable"

	| stmt result |
	fortranCode := '      subroutine mysub ()
      WRITE( STRING, 1) ''A message''
      end
'.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testWriteToInternalFile.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "18"
                },
                "name": "MYSUB"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "3",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "write_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "control_info_list": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "14"
                                },
                                "name": "STRING"
                            }
                        },
                        {
                            "name": "FMT",
                            "parameter": {
                                "label_ref": "1"
                            }
                        }
                    ],
                    "io_list": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "25"
                                },
                                "value": "A message"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 33.
	self assert: stmt endPos equals: 61.

	self assert: stmt ioParameters size equals: 2.

	self assert: stmt ioParameters first class equals: FASTFortranScalarVariable.
	self assert: stmt ioParameters first startPos equals: 40.
	self assert: stmt ioParameters second class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters second startPos equals: 48.

	self assert: stmt arguments size equals: 1.

	self assert: stmt arguments first class equals: FASTFortranCharacterLiteral.
	self assert: stmt arguments first startPos equals: 51.
]
