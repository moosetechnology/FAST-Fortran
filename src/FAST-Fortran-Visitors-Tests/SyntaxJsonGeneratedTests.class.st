Class {
	#name : #SyntaxJsonGeneratedTests,
	#superclass : #AbstractJsonToFASTTests,
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #'as yet unclassified' }
SyntaxJsonGeneratedTests class >> generateTestsFortranSources [

	| directory method stream contents |
	directory := FileLocator workingDirectory / 'pharo'.

	directory files do: [ :file |
		| selector |
		
		1 halt.
		selector := file basenameWithoutExtension.
		"'test'
		            ,
		            (file basenameWithoutExtension copyWithout: $-)
			            capitalized."
			
		(SyntaxJsonToFASTTests selectors includes: self) ifTrue:[
			1 halt.
			].
			
		contents := file contents copyReplaceAll: '''' with: ''''''.
		stream := WriteStream on: String new.
		stream
			nextPutAll: selector;
			nextPutAll: '
		| result |
	
	jsonCode := ''';
			nextPutAll: contents;
			nextPutAll: '''.
	result := self visitJsonCode.	
		'.

		method := stream contents.

		self compile: method ]
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
