# Ultrasound Signal Simulation and Time-of-Flight Analysis  
**A MATLAB-Based Approach for Accurate Distance Measurement Using Ultrasound Signals**
## **Project Overview**
This project focuses on simulating and analyzing ultrasound signals for accurate distance measurement using MATLAB. The goal is to generate transmitted and received ultrasound signals, extract signal envelopes, and measure the Time of Flight (ToF) to determine the distance of a target. The project is divided into three main tasks:

1. **Task 1: Simulation Data Generation and Verification**
   - Simulate a transmitted ultrasound signal using a mathematical model.
   - Generate a received signal by combining the transmitted signal with its delayed and scaled version (echo).
   - Convert the signals to discrete-time and extract the envelope to mitigate errors due to attenuation.
   - Measure ToF using two methods: peak detection and autocorrelation, and compare the results with the ground truth.

2. **Task 2: Recover Envelope from Noisy Received Data and Measure ToF**
   - Introduce noise to the received signal to simulate a more realistic scenario.
   - Recover the envelope using the Hilbert Transform and measure ToF using the same two methods.
   - Evaluate the performance of the methods under varying noise levels and analyze the percentage absolute distance error.

3. **Task 3: Systematic Component of Uncertainty in ToF Estimation**
   - Investigate the effect of finite time resolution on ToF measurements due to non-integer multiples of the sampling period.
   - Compute theoretical resolution errors and measure maximum distance errors for varying parameters.
   - Extend the analysis to variable target distances and compare the performance of the two methods.

## **Key Features**
- Simulation of transmitted and received ultrasound signals.
- Extraction of signal envelopes to reduce errors.
- Measurement of Time of Flight (ToF) using peak detection and autocorrelation.
- Analysis of noise impact and systematic uncertainties in ToF estimation.
- Comprehensive MATLAB implementation with detailed error analysis.

## **Results**
- Successful simulation of ultrasound signals and accurate ToF measurement.
- Robustness evaluation of ToF methods under noisy conditions.
- Insights into systematic uncertainties and their impact on distance measurement accuracy.

## **Technologies Used**
- **MATLAB**: For signal simulation, processing, and analysis.
- **Digital Signal Processing (DSP)**: For envelope extraction and ToF measurement.
- **Mathematical Modeling**: For simulating transmitted and received signals.

## **License**
This project is licensed under the [MIT License](LICENSE) - see the [LICENSE](LICENSE) file for details.


![Kafle_Project_DSP_page-0002](https://github.com/user-attachments/assets/6746c1e6-6a1d-4ab7-b2e9-cbac5a987824)
![Kafle_Project_DSP_page-0003](https://github.com/user-attachments/assets/18ddff67-bca0-400e-aec0-a9b3b39f598a)
![Kafle_Project_DSP_page-0004](https://github.com/user-attachments/assets/db57a805-b890-40eb-9f1c-2b8d587934ac)
![Kafle_Project_DSP_page-0005](https://github.com/user-attachments/assets/fb8d3c62-3e36-4421-9d1c-5f3afbcfa426)
![Kafle_Project_DSP_page-0006](https://github.com/user-attachments/assets/86edf46f-429d-4d9f-af20-75403ed9bd16)
![Kafle_Project_DSP_page-0007](https://github.com/user-attachments/assets/6bb72af5-1b24-4a23-a99d-869ee0952ab8)
![Kafle_Project_DSP_page-0008](https://github.com/user-attachments/assets/58b6ed81-3e5e-40a0-bb68-66dbbbd2456f)
![Kafle_Project_DSP_page-0009](https://github.com/user-attachments/assets/64c7695e-90fa-4378-a796-3352dbeac90c)
![Kafle_Project_DSP_page-0010](https://github.com/user-attachments/assets/a469fd3d-3cd9-4e36-83ba-29ab03181aa3)
![Kafle_Project_DSP_page-0011](https://github.com/user-attachments/assets/ac468119-c27e-4028-b58f-f20b393b77f8)
![Kafle_Project_DSP_page-0012](https://github.com/user-attachments/assets/aa3da1ef-9204-48f0-8fa4-cc6bfc657d08)
![Kafle_Project_DSP_page-0013](https://github.com/user-attachments/assets/3e28383d-feb1-434b-826c-b2288b997d5b)
![Kafle_Project_DSP_page-0014](https://github.com/user-attachments/assets/dbdb66be-4404-4f36-9296-1f06e4be189a)
![Kafle_Project_DSP_page-0015](https://github.com/user-attachments/assets/cba5c07c-fb94-412f-8f1b-41b078c382f1)
![Kafle_Project_DSP_page-0016](https://github.com/user-attachments/assets/ee80b482-d112-4048-ae73-d4bfe9ef49e8)
![Kafle_Project_DSP_page-0017](https://github.com/user-attachments/assets/f02c7f21-bdea-46ee-8616-0c369204f27c)
![Kafle_Project_DSP_page-0018](https://github.com/user-attachments/assets/b12abea8-69e7-453f-b021-c3232d8a6f43)
![Kafle_Project_DSP_page-0019](https://github.com/user-attachments/assets/4609bf89-bfb2-4436-b57d-6f3607b6d259)
![Kafle_Project_DSP_page-0020](https://github.com/user-attachments/assets/7df512a8-9c65-4316-b78b-1f8298e16cc1)
![Kafle_Project_DSP_page-0021](https://github.com/user-attachments/assets/8f180491-eddd-4c08-9ba9-27e3cea57064)
![Kafle_Project_DSP_page-0022](https://github.com/user-attachments/assets/334d080e-085c-4aed-b20d-0efc177e1590)
![Kafle_Project_DSP_page-0023](https://github.com/user-attachments/assets/d6a6482e-5c6c-4f7d-b6e7-080940f02ef4)
![Kafle_Project_DSP_page-0024](https://github.com/user-attachments/assets/a34ff624-5d39-40ff-85c1-37693ddeffef)
![Kafle_Project_DSP_page-0025](https://github.com/user-attachments/assets/1e355689-9a01-414a-a3f0-e0898c667b83)
![Kafle_Project_DSP_page-0026](https://github.com/user-attachments/assets/bf623e16-95d9-4df4-8b28-ebe9579c31d8)
![Kafle_Project_DSP_page-0027](https://github.com/user-attachments/assets/ff1652ea-3acf-4b99-a66f-6b03da731408)
![Kafle_Project_DSP_page-0028](https://github.com/user-attachments/assets/359c9bf5-25b7-47b1-bafc-520bf470b7c3)
![Kafle_Project_DSP_page-0029](https://github.com/user-attachments/assets/7d5c5b26-2a87-4ba9-81d0-d38a43367907)
![Kafle_Project_DSP_page-0030](https://github.com/user-attachments/assets/b6d8fcb1-094e-415b-91b7-67a6aa409987)
![Kafle_Project_DSP_page-0031](https://github.com/user-attachments/assets/31f6ebe8-5fc0-4e02-8cbe-cd297916d344)


