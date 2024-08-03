# Autonomous Vehicle Merging Protocol Model Checking

## Overview

This project involves formal specification and model checking of an autonomous vehicle merging protocol using PRISM model checker. The goal is to evaluate the protocol's performance and safety under varying traffic conditions by modeling different numbers of through and non-through lane vehicles.

### Note:
The protocol used as a reference for this project is derived from the paper **"Formal Specification and Model Checking of an Autonomous Vehicle Merging Protocol"** authored by Minxuan Liu, Dang Duy Bui, Duong Dinh Tran and Kazuhiro Ogata. The original protocol was specified and analyzed using the Maude system. Please take a look at this [paper](https://github.com/user-attachments/files/16477868/Formal_Specification_and_Model_Checking_of_an_Autonomous_Vehicle_Merging_Protocol.pdf) for a comprehensive understanding of the protocol's functionality and details.

## Models

I have generated models for varying numbers of through lane and non-through lane vehicles, ranging from 1 to 8. This results in a total of 8x8 models.

## Properties Checked

I have defined and checked several critical properties for each model. Below are the key critical properties:

1. **Simultaneous Crossing Property:**

      - **Property 1:** `P=? [ F "simultaneous_crossing" ]`
      - **Description:** This property ensures that none of the vehicles cross the merging point simultaneously.
      - **Note:** Probability of this property must be 0.

2. **Termination Property:**

      - **Property 2:** `P=? [ F "termination" ]`
      - **Description:** This property ensures that none of the vehicles will wait forever and that all of them will eventually cross the merging point.
      - **Note:** Probability of this property must be 1.

## File Structure
### logs

- **log/time&memory/** Logs for memory and time usage of each property are located inside this directory.
- **log/verification/** Verification results are located inside this directory.

### prism_models

The models are named according to the number of through lane and non-through lane vehicles. In **`prism_model_ixj.prism`** **i** corresponds to the number of through lane vehicles, 
while **j** indicates non-through lane vehicles. For example:

- `prism_model_1x1.prism`
- `prism_model_2x3.prism`
- `prism_model_8x8.prism`

### prism_properties

The properties files are similarly named to correspond with the models. For example:

- `prism_properties_1x1.props`
- `prism_properties_2x3.props`
- `prism_properties_8x8.props`

### commands.sh

The commands to run the model checker are stored in the `commands.sh` file, which includes time and memory usage logging.

### Dockerfile

The Dockerfile sets up an environment to run the PRISM model checker with all the necessary dependencies and copies over the model and property files.

### scripts

Python scripts that used to generate models and properties according to the number of through and non-through lane vehicles.


