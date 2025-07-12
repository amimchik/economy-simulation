CXX=clang++
CXXFLAGS=--std=c++23 -Wall -Wextra -Iinclude

BLD_DIR=build
OBJ_DIR=$(BLD_DIR)/obj
BIN_DIR=$(BLD_DIR)/bin
TARGET=$(BIN_DIR)/target
SRC_DIR=src
SRCS=$(shell find $(SRC_DIR) -type f -name "*.cpp")
OBJS=$(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS))

all: dirs $(TARGET)


$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CXX) $(CXXFLAGS) -c %< -o $@

dirs:
	mkdir -p $(OBJ_DIR) $(BIN_DIR)

run: all
	./$(TARGET)

clean:
	rm -rf $(BLD_DIR)
