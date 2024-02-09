Class {
	#name : #SyntaxJsonGeneratedTests,
	#superclass : #AbstractJsonToFASTTests,
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests class >> generateTestsFortranSources [

	| directory method stream |
	directory := FileLocator workingDirectory / 'pharo'.

	directory files do: [ :file |
		| selector |
		selector := file basenameWithoutExtension asSymbol.

		(SyntaxJsonToFASTTests includesSelector: selector) ifTrue: [
			| fortranCode jsonCode |
			1 halt.
			
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
SyntaxJsonGeneratedTests >> jsonVisitor [

	^ FASTFortranSyntaxJsonVisitor 
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testArithmetic_if_statement [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/arithmetic_if_statement.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "8"
                            },
                            "name": "N"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "12"
                                },
                                "value": "0"
                            }
                        }
                    ]
                },
                {
                    "tag": "arithmetic_if_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "expression": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "13"
                            },
                            "name": "N"
                        }
                    ],
                    "s1": "10",
                    "s2": "20",
                    "s3": "30"
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testArrayAccess [
		| result |
	
	fortranCode := '      PROGRAM MYPROG
      integer arr(10)
		v = arr(1,i)
      END
 '.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testArrayAccess.FOR",
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
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "3",
                                "column": "8"
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
                                    "column": "12"
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
                                            "column": "16"
                                        },
                                        "value": "1"
                                    }
                                },
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "18"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testArrayDeclaration [
		| result |
	
	fortranCode := '      PROGRAM MYPROG
      integer arr(10)
      END
 '.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testArrayDeclaration.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "16"
                },
                "name": "MYPROG"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
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
                                    "column": "16"
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
                                            "column": "20"
                                        },
                                        "value": "10"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testArrayDeclarationDimensionsWithOperation [
		| result |
	
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
                                        "expression": {
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testArrayDeclarationImplicitLower [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testArrayDeclarationMultipleDimensions [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testArrayDeclarationVariableBound [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testArrayaccess [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/array-access.FOR",
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignement [
		| result |
	
	fortranCode := '      PROGRAM MYPROG
          c = 1
      END
 '.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testAssignement.FOR",
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignementBooleanLiteral [
		| result |
	
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignementFunctionCall [
		| result |
	
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignementIntegerLiteral [
		| result |
	
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignementNegativeIntegerLiteral [
		| result |
	
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignementNegativeRealLiteral [
		| result |
	
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignementRealLiteral [
		| result |
	
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignementScientificNotation [
		| result |
	
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignementStringLiteral [
		| result |
	
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
                                "value": "''once upon a time there were ''''quotes''''! ''"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignementToArrayRange [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignlabel [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/assign-label.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "4",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
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
                                    "line": "1",
                                    "column": "16"
                                },
                                "name": "PHORMAT"
                            },
                            "dimension_declarators": []
                        }
                    ]
                },
                {
                    "label": "2",
                    "tag": "format_statement",
                    "specification": [
                        {
                            "tag": "format_specification",
                            "repeat_factor": "",
                            "descriptor": {
                                "tag": "repeatable_edit_descriptor",
                                "repeated_descriptors": [
                                    "A80"
                                ]
                            },
                            "slash": ""
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "3",
                                "column": "20"
                            },
                            "name": "PHORMAT"
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignment [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/assignment.FOR",
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignmentarith [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/assignment-arith.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "4",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
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
                                    "column": "13"
                                },
                                "name": "A"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "16"
                                },
                                "name": "B"
                            },
                            "dimension_declarators": []
                        }
                    ]
                },
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "DOUBLE PRECISION"
                    },
                    "declarators": [
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
                            "dimension_declarators": []
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "3",
                                "column": "8"
                            },
                            "name": "V"
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
                                        "line": "3",
                                        "column": "12"
                                    },
                                    "name": "A"
                                },
                                "operator": "*",
                                "expression": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "16"
                                    },
                                    "name": "B"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignmentchar [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/assignment-char.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "9",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
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
                                    "line": "1",
                                    "column": "23"
                                },
                                "value": "1"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "18"
                                },
                                "name": "BELL"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "len_specifier": {
                                "tag": "nonzero_unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "29"
                                },
                                "value": "2"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "26"
                                },
                                "name": "C2"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "len_specifier": {
                                "tag": "nonzero_unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "35"
                                },
                                "value": "3"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "32"
                                },
                                "name": "C3"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "len_specifier": {
                                "tag": "nonzero_unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "41"
                                },
                                "value": "5"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "38"
                                },
                                "name": "C5"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "len_specifier": {
                                "tag": "nonzero_unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "47"
                                },
                                "value": "6"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "44"
                                },
                                "name": "C6"
                            },
                            "dimension_declarators": []
                        }
                    ]
                },
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
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
                                    "column": "13"
                                },
                                "name": "Z"
                            },
                            "dimension_declarators": []
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "3",
                                "column": "8"
                            },
                            "name": "C2"
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
                                "value": "''z''"
                            }
                        }
                    ]
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
                            "name": "C3"
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
                                "value": "''uvwxyz''"
                            }
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "5",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "5",
                                "column": "8"
                            },
                            "name": "C5"
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "5",
                                    "column": "13"
                                },
                                "value": "''vwxyz''"
                            }
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "6",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "substring",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "6",
                                    "column": "8"
                                },
                                "name": "C5"
                            },
                            "lower_bound": {
                                "tag": "arithmetic_expression",
                                "expression": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "6",
                                        "column": "11"
                                    },
                                    "value": "1"
                                }
                            },
                            "upper_bound": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "6",
                                    "column": "13"
                                },
                                "value": "2"
                            }
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "6",
                                    "column": "18"
                                },
                                "value": "''AB''"
                            }
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "7",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "7",
                                "column": "8"
                            },
                            "name": "C6"
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "binary_expression",
                                "lhs": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "7",
                                        "column": "13"
                                    },
                                    "name": "C5"
                                },
                                "operator": "//",
                                "expression": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "7",
                                        "column": "19"
                                    },
                                    "name": "C2"
                                }
                            }
                        }
                    ]
                },
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "8",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "8",
                                "column": "8"
                            },
                            "name": "BELL"
                        }
                    ],
                    "right": [
                        {
                            "tag": "array_element_name",
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "8",
                                    "column": "15"
                                },
                                "name": "CHAR"
                            },
                            "qualifiers_list": [
                                {
                                    "tag": "arithmetic_expression",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "8",
                                            "column": "20"
                                        },
                                        "value": "7"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testAssignmentlogical [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/assignment-logical.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "4",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
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
                                    "line": "1",
                                    "column": "16"
                                },
                                "name": "L1"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "20"
                                },
                                "name": "L2"
                            },
                            "dimension_declarators": []
                        }
                    ]
                },
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
                            "name": "L2"
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
                                            "column": "13"
                                        },
                                        "value": ".TRUE."
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
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "3",
                                "column": "8"
                            },
                            "name": "L1"
                        }
                    ],
                    "right": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "3",
                                "column": "13"
                            },
                            "name": "L2"
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBackspaceparameters [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/backspace-parameters.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "backspace_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "19"
                                },
                                "value": "2"
                            }
                        },
                        {
                            "name": "IOSTAT",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "29"
                                },
                                "name": "CODE"
                            }
                        },
                        {
                            "name": "ERR",
                            "parameter": {
                                "label_ref": "9"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBackspaceunit [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/backspace-unit.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "backspace_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "17"
                                },
                                "value": "2"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionDivision [
		| result |
	
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
                                "expression": {
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionEqKeyword [
		| result |
	
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
                                    "expression": {
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionExponentiation [
		| result |
	
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
                                "expression": {
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionGtKeyword [
		| result |
	
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
                                    "expression": {
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionGtSymbol [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionGteKeyword [
		| result |
	
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
                                    "expression": {
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionLtKeyword [
		| result |
	
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
                                    "expression": {
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionLtSymbol [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionLteKeyword [
		| result |
	
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
                                    "expression": {
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionMultiplication [
		| result |
	
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
                                "expression": {
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionNeKeyword [
		| result |
	
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
                                    "expression": {
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionSubstraction [
		| result |
	
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
                                "expression": {
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBinaryExpressionUnaryMinus [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBlockData [
		| result |
	
	fortranCode := '      block data myblck
      common /mycom/ i
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
                                    "column": "15"
                                },
                                "name": "MYCOM"
                            },
                            "nlist": [
                                {
                                    "tag": "variable_declarator",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "22"
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
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBlockdata [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/block-data.FOR",
    "program_units": [
        {
            "tag": "block_data",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "19"
                },
                "name": "INIT"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "4",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "common_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "16"
                                },
                                "name": "RANGE"
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
                                        "name": "X0"
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
                                            "column": "27"
                                        },
                                        "name": "X1"
                                    },
                                    "dimension_declarators": []
                                }
                            ]
                        }
                    ]
                },
                {
                    "tag": "data_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "nlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "13"
                                    },
                                    "name": "X0"
                                },
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "17"
                                    },
                                    "name": "X1"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "22"
                                        },
                                        "value": "2.0"
                                    }
                                },
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "27"
                                        },
                                        "value": "6.0"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testBlockdataemptyname [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/block-data-empty-name.FOR",
    "program_units": [
        {
            "tag": "block_data",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "4",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "''common_statement''",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "16"
                                },
                                "name": "RANGE"
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
                                        "name": "X0"
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
                                            "column": "27"
                                        },
                                        "name": "X1"
                                    },
                                    "dimension_declarators": []
                                }
                            ]
                        }
                    ]
                },
                {
                    "tag": "data_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "nlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "13"
                                    },
                                    "name": "X0"
                                },
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "17"
                                    },
                                    "name": "X1"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "22"
                                        },
                                        "value": "2.0"
                                    }
                                },
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "27"
                                        },
                                        "value": "6.0"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCallSubroutine [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCallemptyarg [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/call-empty-arg.FOR",
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
                    "tag": "call_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "name": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "12"
                        },
                        "name": "ROUTINE"
                    },
                    "arguments": []
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCallnoarg [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/call-no-arg.FOR",
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
                    "tag": "call_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "name": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "12"
                        },
                        "name": "ROUTINE"
                    },
                    "arguments": []
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCallwithargs [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/call-with-args.FOR",
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
                    "tag": "call_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "name": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "2",
                            "column": "12"
                        },
                        "name": "ROUTINE"
                    },
                    "arguments": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "21"
                                },
                                "value": "12"
                            }
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "25"
                            },
                            "name": "VAR"
                        },
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "binary_expression",
                                "lhs": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "30"
                                    },
                                    "name": "EXPR"
                                },
                                "operator": "+",
                                "expression": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "37"
                                    },
                                    "value": "3"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCharactervariables [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/character-variables.FOR",
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
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "17"
                                },
                                "name": "VAR1"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "23"
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
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCharacterwithlen [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/character-with-len.FOR",
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
                                "name": "STRING"
                            },
                            "dimension_declarators": []
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCloseparameters [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/close-parameters.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "close_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "15"
                                },
                                "value": "2"
                            }
                        },
                        {
                            "name": "STATUS",
                            "parameter": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "25"
                                },
                                "value": "''DELETE''"
                            }
                        },
                        {
                            "name": "IOSTAT",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "42"
                                },
                                "name": "I"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testComment [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCommonStatementMultipleGroups [
		| result |
	
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
                    "parameters": [
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCommonStatementNamed [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCommonStatementNoName [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCommonboth [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/common-both.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "18"
                                },
                                "name": "V"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "20"
                                        },
                                        "value": "100"
                                    }
                                }
                            ]
                        }
                    ]
                },
                {
                    "tag": "common_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
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
                                            "column": "15"
                                        },
                                        "name": "V"
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
                                            "column": "18"
                                        },
                                        "name": "M"
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
                                    "column": "22"
                                },
                                "name": "LIMITS"
                            },
                            "nlist": [
                                {
                                    "tag": "variable_declarator",
                                    "variable": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "29"
                                        },
                                        "name": "I"
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
                                            "column": "32"
                                        },
                                        "name": "J"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCommonlabeled [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/common-labeled.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "18"
                                },
                                "name": "V"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "20"
                                        },
                                        "value": "100"
                                    }
                                }
                            ]
                        }
                    ]
                },
                {
                    "tag": "common_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "16"
                                },
                                "name": "LIMITS"
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
                                        "name": "I"
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
                                            "column": "26"
                                        },
                                        "name": "J"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testCommonunlabeled [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/common-unlabeled.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "18"
                                },
                                "name": "V"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "20"
                                        },
                                        "value": "100"
                                    }
                                }
                            ]
                        }
                    ]
                },
                {
                    "tag": "common_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
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
                                            "column": "15"
                                        },
                                        "name": "V"
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
                                            "column": "18"
                                        },
                                        "name": "M"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testContinueStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testContinuestatement [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/continue-statement.FOR",
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
                    "label": "10",
                    "tag": "continue_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    }
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDataStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDataarrayimplieddo [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/data-array-implied-do.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "data_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "nlist": [
                                {
                                    "tag": "data_imply_do_list",
                                    "dlist": [
                                        {
                                            "tag": "array_element_name",
                                            "name": {
                                                "tag": "symbolic_name",
                                                "start_pos": {
                                                    "line": "1",
                                                    "column": "15"
                                                },
                                                "name": "S"
                                            },
                                            "qualifiers_list": [
                                                {
                                                    "tag": "symbolic_name",
                                                    "start_pos": {
                                                        "line": "1",
                                                        "column": "17"
                                                    },
                                                    "name": "I"
                                                },
                                                {
                                                    "tag": "symbolic_name",
                                                    "start_pos": {
                                                        "line": "1",
                                                        "column": "19"
                                                    },
                                                    "name": "I"
                                                }
                                            ]
                                        },
                                        {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "23"
                                            },
                                            "name": "I"
                                        }
                                    ],
                                    "m1": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "25"
                                            },
                                            "value": "1"
                                        }
                                    },
                                    "m2": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "27"
                                            },
                                            "value": "4"
                                        }
                                    },
                                    "m3": {}
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {
                                        "tag": "nonzero_unsigned_int_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "30"
                                        },
                                        "value": "4"
                                    },
                                    "constant": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "32"
                                        },
                                        "value": "1.0"
                                    }
                                }
                            ]
                        },
                        {
                            "nlist": [
                                {
                                    "tag": "data_imply_do_list",
                                    "dlist": [
                                        {
                                            "tag": "data_imply_do_list",
                                            "dlist": [
                                                {
                                                    "tag": "array_element_name",
                                                    "name": {
                                                        "tag": "symbolic_name",
                                                        "start_pos": {
                                                            "line": "1",
                                                            "column": "41"
                                                        },
                                                        "name": "R"
                                                    },
                                                    "qualifiers_list": [
                                                        {
                                                            "tag": "symbolic_name",
                                                            "start_pos": {
                                                                "line": "1",
                                                                "column": "43"
                                                            },
                                                            "name": "I"
                                                        },
                                                        {
                                                            "tag": "symbolic_name",
                                                            "start_pos": {
                                                                "line": "1",
                                                                "column": "45"
                                                            },
                                                            "name": "J"
                                                        }
                                                    ]
                                                },
                                                {
                                                    "tag": "symbolic_name",
                                                    "start_pos": {
                                                        "line": "1",
                                                        "column": "49"
                                                    },
                                                    "name": "J"
                                                }
                                            ],
                                            "m1": {
                                                "tag": "literal_expression",
                                                "literal": {
                                                    "tag": "unsigned_int_constant",
                                                    "start_pos": {
                                                        "line": "1",
                                                        "column": "51"
                                                    },
                                                    "value": "1"
                                                }
                                            },
                                            "m2": {
                                                "tag": "literal_expression",
                                                "literal": {
                                                    "tag": "unsigned_int_constant",
                                                    "start_pos": {
                                                        "line": "1",
                                                        "column": "53"
                                                    },
                                                    "value": "3"
                                                }
                                            },
                                            "m3": {}
                                        },
                                        {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "57"
                                            },
                                            "name": "I"
                                        }
                                    ],
                                    "m1": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "59"
                                            },
                                            "value": "1"
                                        }
                                    },
                                    "m2": {
                                        "tag": "literal_expression",
                                        "literal": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "1",
                                                "column": "61"
                                            },
                                            "value": "2"
                                        }
                                    },
                                    "m3": {}
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {
                                        "tag": "nonzero_unsigned_int_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "65"
                                        },
                                        "value": "6"
                                    },
                                    "constant": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "67"
                                        },
                                        "value": "1.0"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDataintchar [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/data-int-char.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "16"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "5",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
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
                                "value": "1"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "18"
                                },
                                "name": "CR"
                            },
                            "dimension_declarators": []
                        }
                    ]
                },
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
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
                                    "line": "3",
                                    "column": "16"
                                },
                                "name": "I"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "3",
                                    "column": "19"
                                },
                                "name": "N"
                            },
                            "dimension_declarators": []
                        }
                    ]
                },
                {
                    "tag": "data_statement",
                    "start_pos": {
                        "line": "4",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "nlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "4",
                                        "column": "13"
                                    },
                                    "name": "I"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "character_constant",
                                        "start_pos": {
                                            "line": "4",
                                            "column": "16"
                                        },
                                        "value": "''00''"
                                    }
                                }
                            ]
                        },
                        {
                            "nlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "4",
                                        "column": "22"
                                    },
                                    "name": "N"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "character_constant",
                                        "start_pos": {
                                            "line": "4",
                                            "column": "24"
                                        },
                                        "value": "''s12t''"
                                    }
                                }
                            ]
                        },
                        {
                            "nlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "4",
                                        "column": "32"
                                    },
                                    "name": "CR"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "4",
                                            "column": "35"
                                        },
                                        "value": "13"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDatascalars [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/data-scalars.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "data_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "nlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "1",
                                        "column": "13"
                                    },
                                    "name": "TTL"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "character_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "18"
                                        },
                                        "value": "Arbitrary Titles"
                                    }
                                }
                            ]
                        },
                        {
                            "nlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "1",
                                        "column": "39"
                                    },
                                    "name": "M"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "42"
                                        },
                                        "value": "9"
                                    }
                                }
                            ]
                        },
                        {
                            "nlist": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "1",
                                        "column": "46"
                                    },
                                    "name": "N"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "49"
                                        },
                                        "value": "0"
                                    }
                                }
                            ]
                        },
                        {
                            "nlist": [
                                {
                                    "tag": "array_element_name",
                                    "name": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "53"
                                        },
                                        "name": "PAIR"
                                    },
                                    "qualifiers_list": [
                                        {
                                            "tag": "arithmetic_expression",
                                            "expression": {
                                                "tag": "unsigned_int_constant",
                                                "start_pos": {
                                                    "line": "1",
                                                    "column": "58"
                                                },
                                                "value": "1"
                                            }
                                        }
                                    ]
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "62"
                                        },
                                        "value": "9.0"
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
                                        "column": "9"
                                    },
                                    "name": "VEC"
                                }
                            ],
                            "clist": [
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {
                                        "tag": "nonzero_unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "14"
                                        },
                                        "value": "3"
                                    },
                                    "constant": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "16"
                                        },
                                        "value": "9.0"
                                    }
                                },
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "21"
                                        },
                                        "value": "0.1"
                                    }
                                },
                                {
                                    "tag": "data_statement_constant",
                                    "occurence": {},
                                    "constant": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "26"
                                        },
                                        "value": "0.9"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDeclarationIntegerWithInitializer [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionStatementAsterisk [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionStatementExpression [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionStatementMultipleDim [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionStatementMultipleVariables [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionStatementRange [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionStatementSimple [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionStatementVarDims [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionadjustablearray [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/dimension-adjustable-array.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "19"
                },
                "name": "INV"
            },
            "parameters": [
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "24"
                    },
                    "name": "M"
                },
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "27"
                    },
                    "name": "N"
                }
            ],
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "18"
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
                                                "column": "21"
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
                                            "column": "24"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionadjustablenonintbounds [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/dimension-adjustable-nonint-bounds.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "19"
                },
                "name": "ENHANCE"
            },
            "parameters": [
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "28"
                    },
                    "name": "A"
                },
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "31"
                    },
                    "name": "X"
                },
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "34"
                    },
                    "name": "Y"
                }
            ],
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "18"
                                },
                                "name": "A"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "variable_expression",
                                        "variable": {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "20"
                                            },
                                            "name": "X"
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "variable_expression",
                                        "variable": {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "24"
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
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionarrays [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/dimension-arrays.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "18"
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
                                                "line": "1",
                                                "column": "20"
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
                                            "line": "1",
                                            "column": "22"
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
                                    "line": "1",
                                    "column": "26"
                                },
                                "name": "V"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "28"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionassumedsize [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/dimension-assumed-size.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "19"
                },
                "name": "RUN"
            },
            "parameters": [
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "23"
                    },
                    "name": "A"
                },
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "25"
                    },
                    "name": "B"
                },
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "27"
                    },
                    "name": "N"
                }
            ],
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "18"
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
                                    "column": "24"
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
                                                "column": "26"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionbounds [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/dimension-bounds.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "18"
                                },
                                "name": "HELIO"
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
                                                    "line": "1",
                                                    "column": "26"
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
                                                "line": "1",
                                                "column": "28"
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
                                                "line": "1",
                                                "column": "31"
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
                                                "line": "1",
                                                "column": "34"
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
                                                "column": "36"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensiondummybounds [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/dimension-dummy-bounds.FOR",
    "program_units": [
        {
            "tag": "subroutine",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "19"
                },
                "name": "ENHANCE"
            },
            "parameters": [
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "28"
                    },
                    "name": "A"
                },
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "31"
                    },
                    "name": "NLO"
                },
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "36"
                    },
                    "name": "NHI"
                }
            ],
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "18"
                                },
                                "name": "A"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "variable_expression",
                                        "variable": {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "20"
                                            },
                                            "name": "NLO"
                                        }
                                    },
                                    "upper_bound": {
                                        "tag": "variable_expression",
                                        "variable": {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "26"
                                            },
                                            "name": "NHI"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDimensionnonintbounds [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/dimension-nonint-bounds.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "parameter_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "20"
                                },
                                "name": "LO"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "unsigned_int_constant",
                                    "start_pos": {
                                        "line": "1",
                                        "column": "25"
                                    },
                                    "value": "1"
                                }
                            }
                        },
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "28"
                                },
                                "name": "HI"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "unsigned_real_constant",
                                    "start_pos": {
                                        "line": "1",
                                        "column": "33"
                                    },
                                    "value": "9.3"
                                }
                            }
                        }
                    ]
                },
                {
                    "tag": "dimension_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "array_declarators": [
                        {
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "18"
                                },
                                "name": "A"
                            },
                            "dimension_declarators": [
                                {
                                    "lower_bound": {
                                        "tag": "variable_expression",
                                        "variable": {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "20"
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
                                                    "column": "24"
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
                                                    "column": "27"
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
                                                "column": "31"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDoStatementEmptyInitIncrementLimit [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDoStatementEmptyNoIncrement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDoStatementNestedOneContinue [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDoStatementWithComment [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDoStatementWithLabelAndContinue [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDoStatementWithLabelAndTerminalStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testDopure [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/do-pure.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
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
                        "line": "1",
                        "column": "7"
                    },
                    "statement_number": "1",
                    "loop_control": {
                        "variable_name": {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "15"
                            },
                            "name": "IVON01"
                        },
                        "init": {
                            "tag": "unsigned_int_constant",
                            "start_pos": {
                                "line": "1",
                                "column": "23"
                            },
                            "value": "1"
                        },
                        "limit": {
                            "tag": "unsigned_int_constant",
                            "start_pos": {
                                "line": "1",
                                "column": "27"
                            },
                            "value": "3"
                        },
                        "increment": {
                            "tag": "unsigned_int_constant",
                            "start_pos": {
                                "line": "1",
                                "column": "32"
                            },
                            "value": "1"
                        }
                    },
                    "statements_list": [
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
                                        "name": "IADN11"
                                    },
                                    "qualifiers_list": [
                                        {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "2",
                                                "column": "14"
                                            },
                                            "name": "IVON01"
                                        }
                                    ]
                                }
                            ],
                            "right": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "24"
                                    },
                                    "name": "IVON01"
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
                                    "name": "A"
                                }
                            ],
                            "right": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "11"
                                    },
                                    "name": "B"
                                }
                            ]
                        },
                        {
                            "label": "1",
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testEndfileparameters [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/endfile-parameters.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "endfile_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "24"
                                },
                                "value": "2"
                            }
                        },
                        {
                            "name": "IOSTAT",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "34"
                                },
                                "name": "KODE"
                            }
                        },
                        {
                            "name": "ERR",
                            "parameter": {
                                "label_ref": "9"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testEndfileunit [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/endfile-unit.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "endfile_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "23"
                                },
                                "value": "2"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testEntryStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testEntrystatement [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/entry-statement.FOR",
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testEquivalence [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/equivalence.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
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
                                    "line": "1",
                                    "column": "20"
                                },
                                "value": "4"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "18"
                                },
                                "name": "A"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "len_specifier": {
                                "tag": "nonzero_unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "25"
                                },
                                "value": "4"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "23"
                                },
                                "name": "B"
                            },
                            "dimension_declarators": []
                        },
                        {
                            "len_specifier": {
                                "tag": "nonzero_unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "33"
                                },
                                "value": "3"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "28"
                                },
                                "name": "C"
                            },
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "1",
                                            "column": "30"
                                        },
                                        "value": "2"
                                    }
                                }
                            ]
                        }
                    ]
                },
                {
                    "tag": "equivalence_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "parameters": [
                        [
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "21"
                                },
                                "name": "A"
                            },
                            {
                                "tag": "array_element_name",
                                "name": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "23"
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
                                                "column": "25"
                                            },
                                            "value": "1"
                                        }
                                    }
                                ]
                            }
                        ],
                        [
                            {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "30"
                                },
                                "name": "B"
                            },
                            {
                                "tag": "array_element_name",
                                "name": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "32"
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
                                                "column": "34"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testEquivalenceStatementOneGroupArrayVariables [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testEquivalenceStatementOneGroupScalarVariables [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testEquivalenceStatementSeveralGroups [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testExit [
		| result |
	
	fortranCode := '      PROGRAM TESTALT
       exit
      END 
 '.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testExit.FOR",
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
                            "name": "EXIT"
                        }
                    ],
                    "right": [
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "2",
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testExternal [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/external.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "external_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "proc_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "17"
                            },
                            "name": "TAN"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "22"
                            },
                            "name": "COS"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "27"
                            },
                            "name": "SIN"
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testExternalStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testFormatStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testFormatstatementr5869 [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/format-statement-r58-69.FOR",
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
                    "label": "1",
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
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testFunctionNoParameter [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testFunctionStatement [
		| result |
	
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
                                "expression": {
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testFunctionWithParameter [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testFunctionWithStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testFunctionstatementarith [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/function-statement-arith.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "16"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "4",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "parameter_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "20"
                                },
                                "name": "PI"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "unsigned_real_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "23"
                                    },
                                    "value": "3.14159"
                                }
                            }
                        }
                    ]
                },
                {
                    "tag": "function_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    },
                    "name": {
                        "tag": "symbolic_name",
                        "start_pos": {
                            "line": "3",
                            "column": "8"
                        },
                        "name": "SPHERE"
                    },
                    "parameters": [],
                    "expression": {
                        "tag": "arithmetic_expression",
                        "expression": {
                            "tag": "binary_expression",
                            "lhs": {
                                "tag": "binary_expression",
                                "lhs": {
                                    "tag": "binary_expression",
                                    "lhs": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "21"
                                        },
                                        "value": "4.0"
                                    },
                                    "operator": "*",
                                    "expression": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "3",
                                            "column": "27"
                                        },
                                        "name": "PI"
                                    }
                                },
                                "operator": "*",
                                "expression": {
                                    "tag": "parenthesis_expression",
                                    "expression": {
                                        "tag": "binary_expression",
                                        "lhs": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "3",
                                                "column": "33"
                                            },
                                            "value": "1"
                                        },
                                        "operator": "**",
                                        "expression": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "3",
                                                "column": "36"
                                            },
                                            "value": "3"
                                        }
                                    }
                                }
                            },
                            "operator": "/",
                            "expression": {
                                "tag": "unsigned_real_constant",
                                "start_pos": {
                                    "line": "3",
                                    "column": "41"
                                },
                                "value": "3.0"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testFunctionuntyped [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/function-untyped.FOR",
    "program_units": [
        {
            "tag": "function",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "16"
                },
                "name": "FCT"
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testFunctionwithparameters [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/function-with-parameters.FOR",
    "program_units": [
        {
            "tag": "function",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "24"
                },
                "name": "SIMPLEFUNCTION"
            },
            "parameters": [
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "40"
                    },
                    "name": "A"
                },
                {
                    "tag": "symbolic_name",
                    "start_pos": {
                        "line": "1",
                        "column": "43"
                    },
                    "name": "B"
                }
            ],
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testGoto [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testGotoComputed [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testGotoassigned [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/goto-assigned.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "5",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "21"
                            },
                            "name": "N"
                        }
                    ]
                },
                {
                    "tag": "goto_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "type": "assigned",
                    "labels": [
                        "10",
                        "20",
                        "30",
                        "40"
                    ],
                    "var": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "2",
                                "column": "14"
                            },
                            "name": "N"
                        }
                    ]
                },
                {
                    "label": "10",
                    "tag": "continue_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    }
                },
                {
                    "label": "40",
                    "tag": "stop_statement",
                    "start_pos": {
                        "line": "4",
                        "column": "8"
                    }
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testGotocomputed [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/goto-computed.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "5",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "goto_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "type": "computed",
                    "labels": [
                        "10",
                        "20",
                        "30",
                        "40"
                    ],
                    "var": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "34"
                            },
                            "name": "N"
                        }
                    ]
                },
                {
                    "label": "10",
                    "tag": "continue_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    }
                },
                {
                    "label": "20",
                    "tag": "continue_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    }
                },
                {
                    "label": "40",
                    "tag": "continue_statement",
                    "start_pos": {
                        "line": "4",
                        "column": "8"
                    }
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testGotounconditional [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/goto-unconditional.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "5",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "assignment_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "left": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "8"
                            },
                            "name": "A"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "unsigned_real_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "12"
                                },
                                "value": "100.0"
                            }
                        }
                    ]
                },
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
                            "name": "B"
                        }
                    ],
                    "right": [
                        {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "unsigned_real_constant",
                                "start_pos": {
                                    "line": "2",
                                    "column": "12"
                                },
                                "value": "0.01"
                            }
                        }
                    ]
                },
                {
                    "tag": "goto_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    },
                    "type": "unconditional",
                    "labels": [
                        "90"
                    ],
                    "var": []
                },
                {
                    "label": "90",
                    "tag": "continue_statement",
                    "start_pos": {
                        "line": "4",
                        "column": "8"
                    }
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfArithmetic [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfElseIf [
		| result |
	
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfElseWithComment [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfElseWithStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfEmpty [
		| result |
	
	fortranCode := '      PROGRAM MYPROG
       IF ( A ) THEN
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfThenWithComment [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfThenWithStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfThenWithTwoStatements [
		| result |
	
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
                                        "value": "'' user''"
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
                                        "value": "'' does not exist''"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfblockemptythen [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/if-block-empty-then.FOR",
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
                                            "column": "12"
                                        },
                                        "name": "X"
                                    },
                                    "operator": ".LT.",
                                    "expression": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "19"
                                        },
                                        "value": "0.0"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfblockifelseifelse [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/if-block-if-elseif-else.FOR",
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
                "line": "9",
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
                            "value": "1"
                        }
                    },
                    "then_statements": [
                        {
                            "tag": "assignment_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "15"
                            },
                            "left": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "15"
                                    },
                                    "name": "NA"
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
                                                "line": "3",
                                                "column": "18"
                                            },
                                            "name": "NA"
                                        },
                                        "operator": "+",
                                        "expression": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "3",
                                                "column": "21"
                                            },
                                            "value": "1"
                                        }
                                    }
                                }
                            ]
                        }
                    ],
                    "else_block": {
                        "tag": "if_else_block",
                        "label": "",
                        "expression": {
                            "tag": "arithmetic_expression",
                            "expression": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "4",
                                    "column": "18"
                                },
                                "value": "2"
                            }
                        },
                        "then_statements": [
                            {
                                "tag": "assignment_statement",
                                "start_pos": {
                                    "line": "5",
                                    "column": "15"
                                },
                                "left": [
                                    {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "5",
                                            "column": "15"
                                        },
                                        "name": "NB"
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
                                                    "line": "5",
                                                    "column": "18"
                                                },
                                                "name": "NB"
                                            },
                                            "operator": "+",
                                            "expression": {
                                                "tag": "unsigned_int_constant",
                                                "start_pos": {
                                                    "line": "5",
                                                    "column": "21"
                                                },
                                                "value": "1"
                                            }
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
                                    "tag": "call_statement",
                                    "start_pos": {
                                        "line": "7",
                                        "column": "15"
                                    },
                                    "name": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "7",
                                            "column": "20"
                                        },
                                        "name": "CENTER"
                                    },
                                    "arguments": []
                                }
                            ],
                            "end_if": {
                                "label": ""
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfblockifthenelse [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/if-block-if-then-else.FOR",
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
                "line": "9",
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
                        "name": "L"
                    },
                    "then_statements": [
                        {
                            "tag": "assignment_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "15"
                            },
                            "left": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "15"
                                    },
                                    "name": "N"
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
                                                "line": "3",
                                                "column": "17"
                                            },
                                            "name": "N"
                                        },
                                        "operator": "+",
                                        "expression": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "3",
                                                "column": "19"
                                            },
                                            "value": "1"
                                        }
                                    }
                                }
                            ]
                        },
                        {
                            "tag": "call_statement",
                            "start_pos": {
                                "line": "4",
                                "column": "15"
                            },
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "4",
                                    "column": "20"
                                },
                                "name": "CALC"
                            },
                            "arguments": []
                        }
                    ],
                    "else_block": {
                        "tag": "else_statement",
                        "else_label": "",
                        "else_statements": [
                            {
                                "tag": "assignment_statement",
                                "start_pos": {
                                    "line": "6",
                                    "column": "15"
                                },
                                "left": [
                                    {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "6",
                                            "column": "15"
                                        },
                                        "name": "K"
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
                                                    "line": "6",
                                                    "column": "17"
                                                },
                                                "name": "K"
                                            },
                                            "operator": "+",
                                            "expression": {
                                                "tag": "unsigned_int_constant",
                                                "start_pos": {
                                                    "line": "6",
                                                    "column": "19"
                                                },
                                                "value": "1"
                                            }
                                        }
                                    }
                                ]
                            },
                            {
                                "tag": "call_statement",
                                "start_pos": {
                                    "line": "7",
                                    "column": "15"
                                },
                                "name": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "7",
                                        "column": "20"
                                    },
                                    "name": "DISP"
                                },
                                "arguments": []
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfblockifthenelseif [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/if-block-if-then-elseif.FOR",
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
                "line": "9",
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
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "13"
                                        },
                                        "name": "C"
                                    },
                                    "operator": ".EQ.",
                                    "expression": {
                                        "tag": "character_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "value": "''a''"
                                    }
                                }
                            }
                        }
                    },
                    "then_statements": [
                        {
                            "tag": "assignment_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "15"
                            },
                            "left": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "15"
                                    },
                                    "name": "NA"
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
                                                "line": "3",
                                                "column": "18"
                                            },
                                            "name": "NA"
                                        },
                                        "operator": "+",
                                        "expression": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "3",
                                                "column": "21"
                                            },
                                            "value": "1"
                                        }
                                    }
                                }
                            ]
                        },
                        {
                            "tag": "call_statement",
                            "start_pos": {
                                "line": "4",
                                "column": "15"
                            },
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "4",
                                    "column": "20"
                                },
                                "name": "APPEND"
                            },
                            "arguments": []
                        }
                    ],
                    "else_block": {
                        "tag": "if_else_block",
                        "label": "",
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
                                                "line": "5",
                                                "column": "18"
                                            },
                                            "name": "C"
                                        },
                                        "operator": ".EQ.",
                                        "expression": {
                                            "tag": "character_constant",
                                            "start_pos": {
                                                "line": "5",
                                                "column": "25"
                                            },
                                            "value": "''b''"
                                        }
                                    }
                                }
                            }
                        },
                        "then_statements": [
                            {
                                "tag": "assignment_statement",
                                "start_pos": {
                                    "line": "6",
                                    "column": "15"
                                },
                                "left": [
                                    {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "6",
                                            "column": "15"
                                        },
                                        "name": "NB"
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
                                                    "line": "6",
                                                    "column": "18"
                                                },
                                                "name": "NB"
                                            },
                                            "operator": "+",
                                            "expression": {
                                                "tag": "unsigned_int_constant",
                                                "start_pos": {
                                                    "line": "6",
                                                    "column": "21"
                                                },
                                                "value": "1"
                                            }
                                        }
                                    }
                                ]
                            },
                            {
                                "tag": "call_statement",
                                "start_pos": {
                                    "line": "7",
                                    "column": "15"
                                },
                                "name": {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "7",
                                        "column": "20"
                                    },
                                    "name": "BEFORE"
                                },
                                "arguments": []
                            }
                        ],
                        "else_block": {
                            "else_statements": [],
                            "end_if": {
                                "label": ""
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfblocklabeledif [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/if-block-labeled-if.FOR",
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
                    "label": "9",
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
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "13"
                                        },
                                        "name": "Y"
                                    },
                                    "operator": ".LT.",
                                    "expression": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "20"
                                        },
                                        "value": "0.0"
                                    }
                                }
                            }
                        }
                    },
                    "then_statements": [
                        {
                            "tag": "assignment_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "15"
                            },
                            "left": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "15"
                                    },
                                    "name": "MIN"
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
                                                "line": "3",
                                                "column": "21"
                                            },
                                            "name": "NODE"
                                        },
                                        "operator": "-",
                                        "expression": {
                                            "tag": "unsigned_int_constant",
                                            "start_pos": {
                                                "line": "3",
                                                "column": "28"
                                            },
                                            "value": "1"
                                        }
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfblocknested [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/if-block-nested.FOR",
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
                "line": "15",
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
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "13"
                                        },
                                        "name": "PRESSURE"
                                    },
                                    "operator": ".GT.",
                                    "expression": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "27"
                                        },
                                        "value": "1000.0"
                                    }
                                }
                            }
                        }
                    },
                    "then_statements": [
                        {
                            "tag": "block_if_statement",
                            "start_pos": {
                                "line": "3",
                                "column": "15"
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
                                                    "line": "3",
                                                    "column": "20"
                                                },
                                                "name": "N"
                                            },
                                            "operator": ".LT.",
                                            "expression": {
                                                "tag": "unsigned_real_constant",
                                                "start_pos": {
                                                    "line": "3",
                                                    "column": "27"
                                                },
                                                "value": "0.0"
                                            }
                                        }
                                    }
                                }
                            },
                            "then_statements": [
                                {
                                    "tag": "assignment_statement",
                                    "start_pos": {
                                        "line": "4",
                                        "column": "22"
                                    },
                                    "left": [
                                        {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "4",
                                                "column": "22"
                                            },
                                            "name": "X"
                                        }
                                    ],
                                    "right": [
                                        {
                                            "tag": "arithmetic_expression",
                                            "expression": {
                                                "tag": "unsigned_real_constant",
                                                "start_pos": {
                                                    "line": "4",
                                                    "column": "26"
                                                },
                                                "value": "0.0"
                                            }
                                        }
                                    ]
                                },
                                {
                                    "tag": "assignment_statement",
                                    "start_pos": {
                                        "line": "5",
                                        "column": "22"
                                    },
                                    "left": [
                                        {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "5",
                                                "column": "22"
                                            },
                                            "name": "Y"
                                        }
                                    ],
                                    "right": [
                                        {
                                            "tag": "arithmetic_expression",
                                            "expression": {
                                                "tag": "unsigned_real_constant",
                                                "start_pos": {
                                                    "line": "5",
                                                    "column": "26"
                                                },
                                                "value": "0.0"
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
                                            "line": "7",
                                            "column": "22"
                                        },
                                        "left": [
                                            {
                                                "tag": "symbolic_name",
                                                "start_pos": {
                                                    "line": "7",
                                                    "column": "22"
                                                },
                                                "name": "Z"
                                            }
                                        ],
                                        "right": [
                                            {
                                                "tag": "arithmetic_expression",
                                                "expression": {
                                                    "tag": "unsigned_real_constant",
                                                    "start_pos": {
                                                        "line": "7",
                                                        "column": "26"
                                                    },
                                                    "value": "0.0"
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
                    ],
                    "else_block": {
                        "tag": "if_else_block",
                        "label": "",
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
                                                "line": "9",
                                                "column": "18"
                                            },
                                            "name": "TEMPERATURE"
                                        },
                                        "operator": ".GT.",
                                        "expression": {
                                            "tag": "unsigned_real_constant",
                                            "start_pos": {
                                                "line": "9",
                                                "column": "35"
                                            },
                                            "value": "547.0"
                                        }
                                    }
                                }
                            }
                        },
                        "then_statements": [
                            {
                                "tag": "assignment_statement",
                                "start_pos": {
                                    "line": "10",
                                    "column": "15"
                                },
                                "left": [
                                    {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "10",
                                            "column": "15"
                                        },
                                        "name": "Z"
                                    }
                                ],
                                "right": [
                                    {
                                        "tag": "arithmetic_expression",
                                        "expression": {
                                            "tag": "unsigned_real_constant",
                                            "start_pos": {
                                                "line": "10",
                                                "column": "19"
                                            },
                                            "value": "1.0"
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
                                        "line": "12",
                                        "column": "15"
                                    },
                                    "left": [
                                        {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "12",
                                                "column": "15"
                                            },
                                            "name": "X"
                                        }
                                    ],
                                    "right": [
                                        {
                                            "tag": "arithmetic_expression",
                                            "expression": {
                                                "tag": "unsigned_real_constant",
                                                "start_pos": {
                                                    "line": "12",
                                                    "column": "19"
                                                },
                                                "value": "1.0"
                                            }
                                        }
                                    ]
                                },
                                {
                                    "tag": "assignment_statement",
                                    "start_pos": {
                                        "line": "13",
                                        "column": "15"
                                    },
                                    "left": [
                                        {
                                            "tag": "symbolic_name",
                                            "start_pos": {
                                                "line": "13",
                                                "column": "15"
                                            },
                                            "name": "Y"
                                        }
                                    ],
                                    "right": [
                                        {
                                            "tag": "arithmetic_expression",
                                            "expression": {
                                                "tag": "unsigned_real_constant",
                                                "start_pos": {
                                                    "line": "13",
                                                    "column": "19"
                                                },
                                                "value": "1.0"
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
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIfblockthen [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/if-block-then.FOR",
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
                                            "column": "12"
                                        },
                                        "name": "X"
                                    },
                                    "operator": ".LT.",
                                    "expression": {
                                        "tag": "unsigned_real_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "19"
                                        },
                                        "value": "0.0"
                                    }
                                }
                            }
                        }
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
                                    "name": "MIN"
                                }
                            ],
                            "right": [
                                {
                                    "tag": "symbolic_name",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "15"
                                    },
                                    "name": "NODE"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testImplicitNoneStatement [
		| result |
	
	fortranCode := '      PROGRAM MYPROG
       implicit none
      END
 '.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testImplicitNoneStatement.FOR",
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
                            "name": "IMPLICITNONE"
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
                                "value": ""
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testImplicitStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testImplicitStatementCharacterSize [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testImplicitStatementNoRange [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testImplicitStatementSeveralItems [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testImplicitr21c [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/implicit-r21c.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "implicit_statement",
                    "start_pos": {
                        "line": "1",
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
                                            "line": "1",
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
                                            "line": "1",
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
                                            "line": "1",
                                            "column": "30"
                                        },
                                        "name": "W"
                                    },
                                    "right": {}
                                }
                            ]
                        },
                        {
                            "type": {
                                "tag": "type_reference",
                                "name": "CHARACTER",
                                "len_specification": {
                                    "tag": "nonzero_unsigned_int_constant",
                                    "start_pos": {
                                        "line": "1",
                                        "column": "44"
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
                                            "line": "1",
                                            "column": "47"
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
                                            "line": "1",
                                            "column": "49"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testImplicitr21d [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/implicit-r21d.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "implicit_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "parameters": [
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
                                            "line": "1",
                                            "column": "26"
                                        },
                                        "name": "A"
                                    },
                                    "right": {
                                        "tag": "symbolic_name",
                                        "start_pos": {
                                            "line": "1",
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testImpliedDoExpression [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testInquireStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testInquireStatementFilename [
		| result |
	
	fortranCode := '      program main
      NQUIRE( FILE=''.profile'', EXIST=THERE ) end
 '.
	jsonCode := ''.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testInquireStatementImplicitUnit [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testInquirefileexist [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/inquire-file-exist.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "inquire_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "FILE",
                            "parameter": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "21"
                                },
                                "value": ".profile"
                            }
                        },
                        {
                            "name": "EXIST",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "39"
                                },
                                "name": "THERE"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testInquireunitopen [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/inquire-unit-open.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "inquire_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "21"
                                },
                                "value": "3"
                            }
                        },
                        {
                            "name": "OPENED",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "31"
                                },
                                "name": "OK"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testInquireunitopennames [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/inquire-unit-open-names.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "inquire_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "18"
                                },
                                "value": "3"
                            }
                        },
                        {
                            "name": "OPENED",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "28"
                                },
                                "name": "OK"
                            }
                        },
                        {
                            "name": "NAMED",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "38"
                                },
                                "name": "HASNAME"
                            }
                        },
                        {
                            "name": "NAME",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "52"
                                },
                                "name": "FN"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIntegerarray [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/integer-array.FOR",
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
                            "dimension_declarators": [
                                {
                                    "tag": "literal_expression",
                                    "literal": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "17"
                                        },
                                        "value": "10"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIntegervariable [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/integer-variable.FOR",
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIntrinsic [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/intrinsic.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "intrinsic_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "fun_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "18"
                            },
                            "name": "SIN"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "23"
                            },
                            "name": "COS"
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testIntrinsicStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testLabeledstatement [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/labeled-statement.FOR",
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
                    "label": "123",
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testLogicalIfEmpty [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testLogicalifr35 [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/logical-if-r35.FOR",
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
                    "tag": "logical_if_statement",
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
                                            "column": "12"
                                        },
                                        "name": "TALLY"
                                    },
                                    "operator": ".GE.",
                                    "expression": {
                                        "tag": "unsigned_int_constant",
                                        "start_pos": {
                                            "line": "2",
                                            "column": "23"
                                        },
                                        "value": "1000"
                                    }
                                }
                            }
                        }
                    },
                    "statement": {
                        "tag": "return_statement",
                        "start_pos": {
                            "line": "2",
                            "column": "30"
                        }
                    }
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testLogicalvariable [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/logical-variable.FOR",
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
                                "name": "BOOL"
                            },
                            "dimension_declarators": []
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testMainProgramAndSubroutine [
		| result |
	
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testMainProgramEmptyBody [
		| result |
	
	fortranCode := '      program main
      end
 '.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testMainProgramEmptyBody.FOR",
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testOpenStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testOpenimplicitunit [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/open-implicit-unit.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "open_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
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
                                    "line": "1",
                                    "column": "20"
                                },
                                "value": "v"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testOpenparameters [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/open-parameters.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "open_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "17"
                                },
                                "value": "8"
                            }
                        },
                        {
                            "name": "FILE",
                            "parameter": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "25"
                                },
                                "value": "''projectA/data.test''"
                            }
                        },
                        {
                            "name": "ERR",
                            "parameter": {
                                "label_ref": "99"
                            }
                        },
                        {
                            "name": "RECL",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "60"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testOpenunitfile [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/open-unit-file.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "open_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "17"
                                },
                                "value": "8"
                            }
                        },
                        {
                            "name": "FILE",
                            "parameter": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "25"
                                },
                                "value": "''projectA/data.test''"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testParameterStatement [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testParametercount [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/parameter-count.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "16"
                },
                "name": "MAIN"
            },
            "parameters": [],
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "4",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "type_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "8"
                    },
                    "type": {
                        "tag": "type_reference",
                        "name": "CHARACTER"
                    },
                    "declarators": [
                        {
                            "len_specifier": {
                                "asterisk": "*"
                            },
                            "tag": "variable_declarator",
                            "variable": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "18"
                                },
                                "name": "HEADING"
                            },
                            "dimension_declarators": []
                        }
                    ]
                },
                {
                    "tag": "parameter_statement",
                    "start_pos": {
                        "line": "3",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "3",
                                    "column": "19"
                                },
                                "name": "HEADING"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "character_constant",
                                    "start_pos": {
                                        "line": "3",
                                        "column": "27"
                                    },
                                    "value": "''I/O Error Number''"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testParameterrealcharlog [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/parameter-real-char-log.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "3",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "parameter_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "parameters": [
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "19"
                                },
                                "name": "EPSILON"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "unsigned_real_constant",
                                    "start_pos": {
                                        "line": "1",
                                        "column": "27"
                                    },
                                    "value": "1.0E-6"
                                }
                            }
                        },
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "35"
                                },
                                "name": "PI"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "unsigned_real_constant",
                                    "start_pos": {
                                        "line": "1",
                                        "column": "38"
                                    },
                                    "value": "3.141593"
                                }
                            }
                        },
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "48"
                                },
                                "name": "HEADING"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "character_constant",
                                    "start_pos": {
                                        "line": "1",
                                        "column": "56"
                                    },
                                    "value": "'' IO Error #''"
                                }
                            }
                        },
                        {
                            "name": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "2",
                                    "column": "9"
                                },
                                "name": "T"
                            },
                            "expression": {
                                "tag": "logical_const_expr",
                                "expression": {
                                    "tag": "logical_constant",
                                    "start_pos": {
                                        "line": "2",
                                        "column": "11"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testPauseStatementEmpty [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testPauseStatementWithInteger [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testPauseStatementWithString [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testPausecharacter [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/pause-character.FOR",
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
                    "tag": "pause_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    },
                    "argument": {
                        "tag": "character_constant",
                        "start_pos": {
                            "line": "2",
                            "column": "13"
                        },
                        "value": "this message is printed"
                    }
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testPauseempty [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/pause-empty.FOR",
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
                    "tag": "pause_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    }
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testPrintMultipleVariables [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testPrintOneVariable [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testPrintformatiolist [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/print-format-iolist.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "print_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "io_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "17"
                            },
                            "name": "NODE"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "23"
                            },
                            "name": "TEXT"
                        }
                    ],
                    "format": [
                        {
                            "name": "FMT",
                            "parameter": {
                                "label_ref": "1"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testProgrammain [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/program-main.FOR",
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testReadWithFormat [
		| result |
	
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
                                "value": "''(5F4.1)''"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testReadformatiolist [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/read-format-iolist.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "read_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "control_info_list": [],
                    "io_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "15"
                            },
                            "name": "X"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "18"
                            },
                            "name": "Y"
                        }
                    ],
                    "format": [
                        {
                            "name": "FMT",
                            "parameter": {
                                "label_ref": "2"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testReadnamelistiolist [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/read-namelist-iolist.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "read_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "control_info_list": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "13"
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
                            "name": "ERR",
                            "parameter": "8"
                        },
                        {
                            "name": "END",
                            "parameter": "9"
                        },
                        {
                            "name": "END",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "40"
                                },
                                "name": "N"
                            }
                        }
                    ],
                    "io_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "44"
                            },
                            "name": "X"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "47"
                            },
                            "name": "Y"
                        }
                    ],
                    "format": []
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testReturnStatementEmpty [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testReturnempty [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/return-empty.FOR",
    "program_units": [
        {
            "tag": "function",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "24"
                },
                "name": "FCT"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testRewindStatementIOParameters [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testRewindStatementUnit [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testRewindparameters [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/rewind-parameters.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "rewind_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "22"
                                },
                                "value": "3"
                            }
                        },
                        {
                            "name": "IOSTAT",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "34"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testRewindunit [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/rewind-unit.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "rewind_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "parameters": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testSave [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/save.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "save_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "var_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "13"
                            },
                            "name": "A"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "17"
                            },
                            "name": "B"
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testSimplefunction [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/simple-function.FOR",
    "program_units": [
        {
            "tag": "function",
            "name": {
                "tag": "symbolic_name",
                "start_pos": {
                    "line": "1",
                    "column": "24"
                },
                "name": "SIMPLEFUNCTION"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testSimplemain [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/simple-main.FOR",
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
                "line": "2",
                "column": "9"
            },
            "statement_list": []
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testSimplesubroutine [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/simple-subroutine.FOR",
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
                        "line": "1",
                        "column": "39"
                    },
                    "name": "B"
                }
            ],
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testStatementWithLabel [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testStopStatementEmpty [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testStopStatementWithInteger [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testStopempty [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/stop-empty.FOR",
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
                    "tag": "stop_statement",
                    "start_pos": {
                        "line": "2",
                        "column": "7"
                    }
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testStopint [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/stop-int.FOR",
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
                        "value": "12"
                    }
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testSubroutine [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/subroutine.FOR",
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testSubroutineEmpty [
		| result |
	
	fortranCode := '      SUBROUTINE RANK
      end
 '.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testSubroutineEmpty.FOR",
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testSubroutineWithParameters [
		| result |
	
	fortranCode := '      SUBROUTINE SIMPLESUBROUTINE( a, b)
      END
 '.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testSubroutineWithParameters.FOR",
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
                        "line": "1",
                        "column": "39"
                    },
                    "name": "B"
                }
            ],
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testSubroutineWithParametersOnTwoLines [
		| result |
	
	fortranCode := '      SUBROUTINE SIMPLESUBROUTINE( a,
     & b)
      continue
      END
 '.
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/testSubroutineWithParametersOnTwoLines.FOR",
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testSubroutinewithparameters [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/subroutine-with-parameters.FOR",
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
                        "line": "1",
                        "column": "39"
                    },
                    "name": "B"
                }
            ],
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testSubroutinewithparameterstwolines [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/pharo/subroutine-with-parameters-two-lines.FOR",
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
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testTokenPosition [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testVariableDeclarationCharacter [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testVariableDeclarationInteger [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testVariableDeclarationIntegerWithLength [
		| result |
	
	fortranCode := '      program main
      integer*8 i
      end
 '.
	jsonCode := ''.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testVariableDeclarationLogical [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testVariableDeclarationReal [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testVariableDeclarationWithLength [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testVariableDeclarationWithStarSize [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testWriteArrayIOParameter [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testWriteComplexFormat [
		| result |
	
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
                                "value": "''(5F4.1)''"
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testWriteFullIOParameters [
		| result |
	
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
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testWriteStarStarIOParameters [
		| result |
	
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
                                "value": "''I/O error''"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testWriteToInternalFile [
		| result |
	
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
                                "value": "''A message''"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testWriteimplicituimplicitfmterrio [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/write-implicit-u-implicit-fmt-err-io.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "8"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "tag": "write_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
                    },
                    "control_info_list": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "15"
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
                            "name": "ERR",
                            "parameter": "8"
                        },
                        {
                            "name": "END",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "35"
                                },
                                "name": "N"
                            }
                        }
                    ],
                    "io_list": [
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "39"
                            },
                            "name": "X"
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "42"
                            },
                            "name": "Y"
                        }
                    ]
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testWritestarstariolist [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/write-star-star-iolist.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "1"
            },
            "end_pos": {
                "line": "2",
                "column": "10"
            },
            "statement_list": [
                {
                    "label": "8",
                    "tag": "write_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "8"
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
                                    "line": "1",
                                    "column": "22"
                                },
                                "value": "I/O error # "
                            }
                        },
                        {
                            "tag": "symbolic_name",
                            "start_pos": {
                                "line": "1",
                                "column": "38"
                            },
                            "name": "N"
                        },
                        {
                            "tag": "character_expression",
                            "expression": {
                                "tag": "character_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "41"
                                },
                                "value": ", on 1"
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
		
]

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests >> testWriteunitnml [
		| result |
	
	jsonCode := '{
    "tag": "fortran_file",
    "comments": {},
    "file": "test/unit-tests/write-unit-nml.FOR",
    "program_units": [
        {
            "tag": "main",
            "name": "null",
            "start_pos": {
                "line": "1",
                "column": "7"
            },
            "end_pos": {
                "line": "2",
                "column": "9"
            },
            "statement_list": [
                {
                    "tag": "write_statement",
                    "start_pos": {
                        "line": "1",
                        "column": "7"
                    },
                    "control_info_list": [
                        {
                            "name": "UNIT",
                            "parameter": {
                                "tag": "unsigned_int_constant",
                                "start_pos": {
                                    "line": "1",
                                    "column": "19"
                                },
                                "value": "1"
                            }
                        },
                        {
                            "name": "NML",
                            "parameter": {
                                "tag": "symbolic_name",
                                "start_pos": {
                                    "line": "1",
                                    "column": "26"
                                },
                                "name": "G"
                            }
                        }
                    ],
                    "io_list": []
                }
            ]
        }
    ]
}
'.
	result := self visitJsonCode.	
		
]
